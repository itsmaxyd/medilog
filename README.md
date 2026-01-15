# MediLog - Family Medical Records App

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![F-Droid](https://img.shields.io/badge/F--Droid-compliant-green)](https://f-droid.org/)

A privacy-focused, completely offline Android application for recording and managing family medical history. Designed with elderly users in mind, featuring large buttons, high contrast UI, and simple navigation.

## Features

### v1.0.0 - Core Features
- 👤 **Multiple User Profiles** - Manage records for entire family with emoji avatars
- 🏥 **Doctor Visits** - Record visits with prescriptions, tests, and follow-ups
- 💊 **Medicine Database** - Offline database of 253,000+ Indian medicines
- 📄 **OCR Scanning** - Scan prescriptions and reports using on-device ML
- 📊 **Vitals Tracking** - Weight, BP, heart rate monitoring
- 🩺 **Health Conditions** - Track chronic diseases like BP, diabetes, PCOS
- 📋 **Test Reports** - Store and manage medical test results
- 🏥 **Insurance Management** - Track policies and premium due dates
- 📆 **Period Tracker** - Cycle logging and ovulation prediction (for female users)
- 🔔 **Smart Reminders** - Medicine, follow-ups, insurance, vitals
- 💡 **Health Tips** - Curated wellness advice from WHO, CDC, Mayo Clinic

## Privacy First

- ✅ **100% Offline** - No internet connection required
- ✅ **No Cloud Sync** - All data stays on your device
- ✅ **F-Droid Compliant** - No proprietary dependencies
- ✅ **No Analytics** - Zero tracking or telemetry
- ✅ **Open Source** - GPLv3 licensed

## Requirements

- Android 11 (API 30) or higher
- ~100MB storage space (including medicine database)
- Camera permission (optional, for OCR scanning)

## Installation

### From F-Droid (Recommended)
```bash
# Coming soon to F-Droid repository
```

### Build from Source
```bash
# Prerequisites: Flutter 3.10.1 or higher
git clone https://github.com/yourusername/medilog.git
cd medilog

# Get dependencies
flutter pub get

# Build APK
flutter build apk --release

# Install on device
adb install build/app/outputs/flutter-apk/app-release.apk
```

## Development

### Setup
```bash
# Install Flutter SDK from https://flutter.dev/docs/get-started/install

# Clone repository
git clone https://github.com/yourusername/medilog.git
cd medilog

# Install dependencies
flutter pub get

# Generate Drift database code
flutter pub run build_runner build --delete-conflicting-outputs

# Run app
flutter run
```

### Project Structure
```
lib/
├── data/           # Database, models, repositories
├── features/       # UI screens by feature
├── services/       # Notifications, OCR
└── core/           # Theme, constants, utilities

assets/
├── medicines.db    # Pre-built SQLite database
└── health_tips.json
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Credits

See [CREDITS.md](CREDITS.md) for third-party attributions.

## Support

For bug reports and feature requests, please use the [GitHub Issues](https://github.com/yourusername/medilog/issues) page.

---

**Built with Love for families who care about health privacy**

*Max Demon*