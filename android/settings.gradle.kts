pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.9.1" apply false
    id("org.jetbrains.kotlin.android") version "2.0.21" apply false
}

dependencyResolutionManagement {
    // Cambiamos a PREFER_PROJECT o añadimos el motor de Flutter
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        // REPOSITORIO CRÍTICO DE FLUTTER (Añadir esta línea)
        maven { url = java.net.URI("https://storage.googleapis.com/download.flutter.io") }
        
        // REPOSITORIO DE MAPBOX
        maven {
            url = java.net.URI("https://api.mapbox.com/downloads/v2/releases/maven")
            authentication {
                create<BasicAuthentication>("basic")
            }
            credentials {
                username = "mapbox"
                password = providers.gradleProperty("MAPBOX_DOWNLOADS_TOKEN").orNull 
                    ?: System.getenv("MAPBOX_DOWNLOADS_TOKEN") 
                    ?: ""
            }
        }
    }
}

include(":app")

