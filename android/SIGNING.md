# Android App Signing Guide

To release MediLog on the Google Play Store, you need to sign your app with a production key.

## 1. Generate a Keystore
If you don't have one, generate a keystore file using `keytool`:

```bash
keytool -genkey -v -keystore ~/upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload
```

## 2. Configure `key.properties`
Create a file named `android/key.properties` with the following content:

```properties
storePassword=<your-store-password>
keyPassword=<your-key-password>
keyAlias=upload
storeFile=/home/max/upload-keystore.jks
```
> [!IMPORTANT]
> Keep `key.properties` and the keystore file secret. **Do not commit them to version control.**

## 3. Update `build.gradle.kts`
The `android/app/build.gradle.kts` is already prepared to use these properties if they exist.

## 4. Google Play Service Account
To use Fastlane for automated uploads, you need a Google Play Service Account JSON key:
1. Go to the [Google Play Console](https://play.google.com/console).
2. Go to **Setup** > **API access**.
3. Create a Google Cloud Project or link an existing one.
4. Create a Service Account and download the JSON key.
5. Place it as `android/fastlane/service-account.json`.
