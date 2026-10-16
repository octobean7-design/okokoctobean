@echo off
setlocal
set GRADLE_VERSION=8.7
set GRADLE_DIST_DIR=%USERPROFILE%\.gradle\wrapper\dists\gradle-%GRADLE_VERSION%-bin
set GRADLE_BIN=%GRADLE_DIST_DIR%\gradle-%GRADLE_VERSION%\bin\gradle.bat

if not exist "%GRADLE_BIN%" (
    echo Downloading Gradle %GRADLE_VERSION%...
    if not exist "%GRADLE_DIST_DIR%" mkdir "%GRADLE_DIST_DIR%"
    powershell -Command "Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%GRADLE_DIST_DIR%\gradle.zip'; Expand-Archive -Path '%GRADLE_DIST_DIR%\gradle.zip' -DestinationPath '%GRADLE_DIST_DIR%' -Force; Remove-Item '%GRADLE_DIST_DIR%\gradle.zip'"
)

call "%GRADLE_BIN%" %*
