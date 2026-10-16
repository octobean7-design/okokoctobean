plugins {
    id("com.android.application")
}

android {
    namespace = "ru.bezpaniki.app"
    compileSdk = 34

    defaultConfig {
        applicationId = "ru.bezpaniki.driver"
        minSdk = 24
        targetSdk = 34
        versionCode = 28
        versionName = "2.8.0-PRO"
    }

    signingConfigs {
        create("releaseKey") {
            storeFile = file("bezpaniki-release.jks")
            storePassword = "BezPaniki2026"
            keyAlias = "bezpaniki_key"
            keyPassword = "BezPaniki2026"
            enableV1Signing = true
            enableV2Signing = true
        }
    }

    buildTypes {
        getByName("debug") {
            isDebuggable = false
            signingConfig = signingConfigs.getByName("releaseKey")
        }
        getByName("release") {
            isDebuggable = false
            isMinifyEnabled = false
            signingConfig = signingConfigs.getByName("releaseKey")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.11.0")
    implementation("androidx.webkit:webkit:1.10.0")
}
