#!/bin/sh
set -e

GRADLE_VERSION="8.7"
GRADLE_DIST_DIR="${HOME}/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
GRADLE_BIN="${GRADLE_DIST_DIR}/gradle-${GRADLE_VERSION}/bin/gradle"

if [ ! -x "${GRADLE_BIN}" ]; then
    echo "Downloading Gradle ${GRADLE_VERSION}..."
    mkdir -p "${GRADLE_DIST_DIR}"
    TMP_ZIP="${GRADLE_DIST_DIR}/gradle-${GRADLE_VERSION}-bin.zip"
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o "${TMP_ZIP}"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -O "${TMP_ZIP}"
    else
        echo "Error: curl or wget is required to download Gradle." >&2
        exit 1
    fi
    unzip -q -o "${TMP_ZIP}" -d "${GRADLE_DIST_DIR}"
    rm -f "${TMP_ZIP}"
    chmod +x "${GRADLE_BIN}"
fi

exec "${GRADLE_BIN}" "$@"
