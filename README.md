# Wellnest Doctor-side Mobile Application

The **Wellnest Doctor-side Mobile Application** is designed to assist doctors in providing mental health support and real-time counseling through the **E-MOGRAM** system. This application allows doctors to access user data, track emotional trends, and provide timely interventions based on sentiment analysis.

## Features

- **Login System**: Doctors can securely log into the app.
- **User Sentiment Tracking**: View users' emotional data and trends.
- **Real-time Counseling**: Engage in real-time counseling sessions with users.
- **Automated Alerts**: Get notifications about users' emotional distress.
- **Data Insights**: Access insights on users' emotional health patterns.

## Installation

### Prerequisites

- Flutter (latest version)
- Android Studio / Xcode for mobile app testing
- Firebase (for push notifications)

### Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/vishnu-anilkumar-cell/wellnest_doctor-main.git
    ```

2. Navigate to the project folder:

    ```bash
    cd wellnest_doctor-main
    ```

3. Install the necessary Flutter dependencies:

    ```bash
    flutter pub get
    ```

4. Configure Firebase by adding the appropriate configuration files (`google-services.json` for Android or `GoogleService-Info.plist` for iOS).

5. Run the application:

    - For Android:

      ```bash
      flutter run --target-platform android
      ```

    - For iOS:

      ```bash
      flutter run --target-platform ios
      ```

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add your feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter for cross-platform development.
- Firebase for push notifications and real-time data.
- E-MOGRAM system for mental health support and sentiment analysis.
