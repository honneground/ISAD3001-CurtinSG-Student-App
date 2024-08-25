# Curtin Singapore Student App

- **Unit**: ISAD3001 — Capstone Computing Project 2
- **Study Period**: 2024 Trimester 2A
- **Degree Programme**: Bachelor of Information Technology — Awarded with Distinction by Curtin University
- **Overall Unit Mark**: 95 (High Distinction)

## Assignment context and constraints

The implementation unit delivered the student application planned in [ISAD3000](../../ISAD3000/CurtinSG-App-Design/README.md). The team implemented and demonstrated the system through iterative sprints and prepared operating instructions, technical documentation, requirements-to-features mapping and a handover package.

The client needed academic, campus and community services available through a coherent mobile interface. University services were reached through their real web entry points; the Flutter client combines native navigation, embedded WebViews, document viewing and links to those services.

## Delivered application

| Module | Source | Behaviour |
|---|---|---|
| Home | `lib/pages/home.dart` | University information cards and entry points |
| Academic | `lib/pages/academic.dart` | Timetable, learning platform, enrolment, attendance and calendar access |
| Timetable/documents | `lib/pages/class_timetable.dart` | Document selection and PDF viewing |
| Campus | `lib/pages/campus.dart` | Library, IT support, student services and booking/service destinations |
| Community | `lib/pages/community.dart` | Embedded forum interface, integrated with the application's appearance |
| Appearance | `lib/main.dart`, `lib/theme/modes.dart` | Navigation shell and system/light/dark themes |

## My contribution

I worked on the Flutter framework, app bar, navigation bar, Academic/Community/Campus/Home interfaces, themes and system adaptation, together with technical/operation documentation, requirements mapping and the branching strategy. I also participated in integrating the team's forum and cloud deployment.

## Build and run

Use a Flutter SDK whose bundled Dart satisfies the `^3.1.1` constraint in `pubspec.yaml`. Android development needs an Android SDK and emulator/device; iOS development needs macOS and Xcode.

```sh
flutter doctor
flutter pub get
flutter devices
flutter run -d <device-id>
```

For an Android release package:

```sh
flutter build apk --release
```

Android and iOS are the documented deployment targets. For other targets, check WebView and other plugin support before building.

## Documentation

- [User guide](docs/user-guide.md)
- [System architecture and feature mapping](docs/architecture.md)
- [Build and deployment handover](docs/deployment.md)
- [Branching strategy](docs/branching.md)
- [First-unit design and visual prototypes](../../ISAD3000/CurtinSG-App-Design/README.md)
