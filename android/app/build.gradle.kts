import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val hasReleaseKeystore = listOf("keyAlias", "keyPassword", "storeFile", "storePassword")
    .all { !keystoreProperties.getProperty(it).isNullOrBlank() }

android {
    namespace = "rs.fungi.fungi_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13846066"

    packaging {
        jniLibs {
            useLegacyPackaging = true
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "rs.fungi.fungi_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "channel"
    productFlavors {
        create("nightly") {
            dimension = "channel"
            applicationIdSuffix = ".nightly"
            resValue("string", "app_name", "Fungi Dev")
        }
        create("stable") {
            dimension = "channel"
            resValue("string", "app_name", "Fungi")
        }
    }

    sourceSets {
        getByName("nightly") {
            jniLibs.srcDir(layout.buildDirectory.dir("generated/fungiJniLibs/nightly"))
        }
        getByName("stable") {
            jniLibs.srcDir(layout.buildDirectory.dir("generated/fungiJniLibs/stable"))
        }
    }

    signingConfigs {
        if (hasReleaseKeystore) {
            create("release") {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storeFile = keystoreProperties.getProperty("storeFile")?.let { file(it) }
                storePassword = keystoreProperties.getProperty("storePassword")
            }
        }
    }

    buildTypes {
        release {
            if (hasReleaseKeystore) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
    }
}

fun flavorTaskName(flavor: String): String =
    flavor.replaceFirstChar { if (it.isLowerCase()) it.titlecase() else it.toString() }

listOf("nightly", "stable").forEach { flavor ->
    val capitalizedFlavor = flavorTaskName(flavor)
    val copyTask = tasks.register<Copy>("copy${capitalizedFlavor}RustBinary") {
        val flutterRoot = project.rootProject.projectDir.parentFile
        val sourceDir = File(flutterRoot, "fungi-artifacts/$flavor/android")
        val outputDir = layout.buildDirectory.dir("generated/fungiJniLibs/$flavor")

        from(sourceDir) {
            include("**/*.so")
        }
        into(outputDir)

        doFirst {
            val nativeLibraries = if (sourceDir.exists()) {
                sourceDir.walkTopDown()
                    .filter { it.isFile && it.name == "libfungi.so" }
                    .toList()
            } else {
                emptyList()
            }

            if (nativeLibraries.isEmpty()) {
                throw GradleException(
                    "Rust binary not found under: ${sourceDir.absolutePath}\n" +
                        "Please ensure 'fungi-artifacts/$flavor/android/<abi>/libfungi.so' exists in the project root."
                )
            }
        }
    }

    tasks.configureEach {
        if (
            name.startsWith("merge$capitalizedFlavor") &&
            (name.endsWith("NativeLibs") || name.endsWith("JniLibFolders"))
        ) {
            dependsOn(copyTask)
        }
    }
}

flutter {
    source = "../.."
}
