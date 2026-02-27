# JanSahayak Mobile Application

JanSahayak is a mobile application designed to assist users in accessing relevant government policies based on their personal information. The app collects user data such as age, gender, occupation, and income level to provide tailored policy recommendations.

## Features

- User-friendly login page for collecting user information.
- Form validation to ensure accurate data entry.
- Fetches and displays relevant government policies based on user input.
- Modular architecture with separate files for services, models, and widgets.

## Project Structure

```
jansahayak_app
├── lib
│   ├── main.dart                # Entry point of the application
│   ├── screens
│   │   └── login_page.dart      # User interface for login
│   ├── services
│   │   └── policy_service.dart   # Handles API calls for policies
│   ├── models
│   │   └── user_info.dart       # Represents user information
│   └── widgets
│       └── form_fields.dart     # Reusable form field widgets
├── test
│   └── widget_test.dart         # Widget tests for the application
├── pubspec.yaml                 # Project dependencies
├── analysis_options.yaml        # Dart analysis options
└── README.md                    # Project documentation
```

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```
   cd jansahayak_app
   ```

3. Install the dependencies:
   ```
   flutter pub get
   ```

4. Run the application:
   ```
   flutter run
   ```

## Usage

- Launch the app and navigate to the login page.
- Fill in the required fields with your information.
- Submit the form to receive personalized government policy recommendations.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.