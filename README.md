
# Registration and Login App

## 📱 Overview
This Flutter app provides:
- Splash screen
- User registration form with validation
- Login form with basic credential check

## 🚀 Features
- Splash screen delays for 2 seconds
- Form validation (username, email, password, confirm password)
- Login screen accepts predefined user data and provides success/failure messages

## 📂 Project Structure
```
lib/
├── main.dart
├── splash_screen.dart
├── registration_screen.dart
└── login_screen.dart
assets/
└── logo.png
```

## 🛠️ Setup
1. Place your logo in `assets/`.
2. Add this in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/logo.png
```
3. Run the app:
```bash
flutter run
```
