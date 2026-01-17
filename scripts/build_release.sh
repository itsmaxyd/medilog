#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting MediLog Build Process..."

# Get dependencies
echo "📦 Getting Flutter packages..."
flutter pub get

# Run code generation if needed
echo "🛠️ Running code generation..."
flutter pub run build_runner build --delete-conflicting-outputs

# Build App Bundle
echo "📦 Building Android App Bundle (AAB)..."
flutter build appbundle --release

# Build APK as well
echo "📦 Building Android APK..."
flutter build apk --release

echo "✅ Build completed successfully!"
echo "📍 App Bundle: build/app/outputs/bundle/release/app-release.aab"
echo "📍 APK: build/app/outputs/flutter-apk/app-release.apk"
