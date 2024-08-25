# Build and Deployment Handover

## Local client setup

1. Install Flutter and the toolchain for the intended Android or iOS target.
2. Run `flutter doctor` and resolve toolchain issues for that target.
3. From this project directory, run `flutter pub get`.
4. Start an emulator or connect a device and use `flutter run -d <device-id>`.

## Android

The author's handover uses `flutter build apk --release` for APK delivery and `flutter build appbundle` for an Android App Bundle. Configure signing with deployment-owned credentials when distributing a new release. Version and build numbers are set by the `version` entry in `pubspec.yaml`.

## iOS

Use macOS with Xcode, an appropriate signing identity and a configured simulator/device. The handover's release workflow uses `flutter build ios --release` and the Xcode distribution process.

## Community service deployment

The delivered system used a Google Cloud Ubuntu host, a LAMP environment, MySQL, Flarum and an SMTP email provider. A new deployment requires its own host, database, mail credentials and forum configuration. The client connects to the community service through its configured endpoint.

