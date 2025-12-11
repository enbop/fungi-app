param(
    [string]$Configuration = "Debug",
    [string]$DestDir = ""
)

Write-Host "========== Copying Rust Binary =========="

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
# The fungi-artifacts directory is located at the root of the Flutter project (fungi-app)
# Relative path from script: ..\..\fungi-artifacts\fungi.exe
$RustBinaryPath = Join-Path $ScriptDir "..\..\fungi-artifacts\fungi.exe"

if ([string]::IsNullOrEmpty($DestDir)) {
    if ($env:CMAKE_BINARY_DIR) {
        $CMakeBinaryDir = $env:CMAKE_BINARY_DIR
    } else {
        # Fallback for when running script manually or outside CMake
        $ProjectRoot = Resolve-Path (Join-Path $ScriptDir "..\..\..") | Select-Object -ExpandProperty Path
        $CMakeBinaryDir = Join-Path $ProjectRoot "flutter_app\build\windows\x64\runner"
    }
    $DestDir = Join-Path $CMakeBinaryDir $Configuration
}

$DestBinary = Join-Path $DestDir "fungi.exe"

Write-Host "Source: $RustBinaryPath"
Write-Host "Destination: $DestBinary"

if (-not (Test-Path $RustBinaryPath)) {
    Write-Host "Error: Rust binary not found at $RustBinaryPath" -ForegroundColor Red
    Write-Host "Please ensure 'fungi-artifacts\fungi.exe' exists in the project root." -ForegroundColor Yellow
    exit 1
}

if (-not (Test-Path $DestDir)) {
    New-Item -ItemType Directory -Path $DestDir -Force | Out-Null
}

$NeedsCopy = $true

if (Test-Path $DestBinary) {
    $SourceItem = Get-Item $RustBinaryPath
    $DestItem = Get-Item $DestBinary
    
    # Compare size and modification time
    if ($SourceItem.Length -eq $DestItem.Length -and $SourceItem.LastWriteTime -eq $DestItem.LastWriteTime) {
        $NeedsCopy = $false
        Write-Host "Binary is identical (size and mtime match). Skipping copy."
    }
}

if ($NeedsCopy) {
    if (Test-Path $DestBinary) {
        Remove-Item $DestBinary -Force
    }
    
    Copy-Item $RustBinaryPath -Destination $DestBinary -Force
    
    # Manually sync LastWriteTime to ensure the check works next time
    $SourceItem = Get-Item $RustBinaryPath
    $DestItem = Get-Item $DestBinary
    $DestItem.LastWriteTime = $SourceItem.LastWriteTime
    
    Write-Host "Copied binary."
}

Write-Host "========== Done =========="
