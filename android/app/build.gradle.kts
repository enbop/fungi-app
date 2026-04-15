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

tasks.register<Copy>("copyRustBinary") {
    val flutterRoot = project.rootProject.projectDir.parentFile
    val sourceFile = File(flutterRoot, "fungi-artifacts/android/arm64-v8a/libfungi.so")
    
    from(sourceFile)
    into(File(projectDir, "src/main/jniLibs/arm64-v8a"))
    
    doFirst {
        if (!sourceFile.exists()) {
            throw GradleException(
                "Rust binary not found at: ${sourceFile.absolutePath}\n" +
                "Please ensure 'fungi-artifacts/android/arm64-v8a/libfungi.so' exists in the project root."
            )
        }
    }
}

tasks.whenTaskAdded {
    if (name.startsWith("merge") && (name.endsWith("NativeLibs") || name.endsWith("JniLibFolders"))) {
        dependsOn("copyRustBinary")
    }
}

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

flutter {
    source = "../.."
}
