# Telegram Bot Manager

A Flutter application for managing Telegram bots with a modern and user-friendly interface.

## Features

- User authentication with Google and Facebook
- Create and manage multiple Telegram bots
- View bot details and statistics
- Edit bot information
- Delete bots
- Secure storage of bot tokens
- Real-time updates

## Getting Started

### Prerequisites

- Flutter SDK (version 3.7.0 or higher)
- Firebase project
- Telegram Bot Token (from @BotFather)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/telegram_bot_manager.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Add Android and iOS apps to your Firebase project
   - Download and add the configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS

4. Configure OAuth:
   - Set up Google Sign-In in Firebase Console
   - Set up Facebook Login in Firebase Console
   - Add the necessary configuration files

5. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── config/
│   ├── routes.dart
│   └── theme.dart
├── features/
│   ├── auth/
│   │   ├── presentation/
│   │   │   ├── bloc/
│   │   │   │   ├── auth_bloc.dart
│   │   │   │   ├── auth_event.dart
│   │   │   │   └── auth_state.dart
│   │   │   └── pages/
│   │   │       ├── login_page.dart
│   │   │       └── register_page.dart
│   └── bot/
│       ├── presentation/
│       │   ├── bloc/
│       │   │   ├── bot_bloc.dart
│       │   │   ├── bot_event.dart
│       │   │   └── bot_state.dart
│       │   └── pages/
│       │       ├── bot_list_page.dart
│       │       ├── bot_create_page.dart
│       │       └── bot_detail_page.dart
└── main.dart
```

## Dependencies

- flutter_bloc: State management
- firebase_core: Firebase integration
- firebase_auth: Authentication
- cloud_firestore: Database
- google_sign_in: Google authentication
- flutter_facebook_auth: Facebook authentication
- telegram_bot_api: Telegram Bot API integration

## Testing

Run the tests with:
```bash
flutter test
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
