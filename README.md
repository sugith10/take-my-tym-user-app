# Take My Tym

![take-my-tym-cover](https://raw.githubusercontent.com/sugith10/images/main/projects/take-my-tym-cover.png)

## Description
Take My Tym is a unique mobile application fully built using Flutter. It is designed to empower individuals by enabling them to efficiently sell and buy skills based on their available time. The platform aims to streamline the process of finding and managing freelance projects by creating a dynamic marketplace centered around time as a valuable commodity. With an intuitive interface and a rich set of features, Take My Tym bridges the gap between those seeking specific services and those offering their skills.

## Table of Contents
- [Take My Tym](#take-my-tym)
  - [Description](#description)
  - [Table of Contents](#table-of-contents)
  - [Usage](#usage)
  - [Features](#features)
    - [Key Files](#key-files)
    - [Core Details](#core-details)
    - [Feature Modules](#feature-modules)
    - [Supporting Files](#supporting-files)
  - [How to Run the App](#how-to-run-the-app)
  - [Contributing](#contributing)
  - [License](#license)

## Usage
To try out the application, you can visit the Amazon App Store and search for "Take My Tym" or click the [link here](#).

## Features
The project follows a clean architecture, feature-first approach. Each feature is modularized, making it easier to maintain and extend.

### Key Files
- **main.dart**: Entry point of the project.
- **app.dart**: Handles root-level Bloc provider.
- **app_view.dart**: Sets up the MaterialApp.

### Core Details
- **assets**: Contains images, fonts, and other assets used throughout the project.
- **bloc**: The Blocs used throughout the modules.
- **const**: Contains constants like default padding, radius, etc.
- **di**: Dependency injection using GetIt.
- **model**: Core models used across the project.
- **observer**: Logger, Bloc observer, route observer.
- **route**: Manages the application routes.
- **theme**: Application theme settings.
- **utils**: Utility functions, helpers, and common methods.
- **widgets**: Reusable UI components.

### Feature Modules
Each module follows clean architecture principles (data, domain, presentation):
- **auth**: Handles authentication (sign in, sign up, etc.).
- **contract**: Manages contracts between users.
- **create_post**: Handles creating new project posts.
- **home**: Home screen management.
- **message**: Messaging system between users.
- **navigation_menu**: Bottom navigation bar and drawer management.
- **notification**: Manages user notifications.
- **onboarding**: Handles user onboarding screens.
- **profile**: Manages user profiles.
- **proposal**: Allows users to create and manage proposals.
- **search**: Search functionality to find skills and users.
- **success**: Handles success messages after completing actions.
- **view_post**: View detailed posts for projects.
- **wallet**: Manages transactions and wallet features.

### Supporting Files
- **firebase_options.dart**: Firebase configuration file (git-ignored).
- **.env**: Contains environment variables for Google Maps API, Stripe keys, and more (git-ignored).

## How to Run the App

### Prerequisites
1. Install [Flutter](https://flutter.dev/docs/get-started/install) on your machine.
2. Set up a Firebase project and enable Firebase Auth, Firestore, Firestore Database, and Analytics.
3. Create an `.env` file in the root directory with the following content:

   ```
   GOOGLE_MAPS_API_KEY=your_google_maps_api_key
   STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
   STRIPE_SECRET_KEY=your_stripe_secret_key
   ```

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/take-my-tym.git
   cd take-my-tym
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the app** on your desired platform:

   - For Android:

     ```bash
     flutter run
     ```

   - For iOS, open the project in Xcode:

     ```bash
     open ios/Runner.xcworkspace
     ```

     Then build the app in Xcode by selecting your device and pressing "Run."

4. **Set up Firebase**:
   - Download the `google-services.json` file (for Android) and the `GoogleService-Info.plist` file (for iOS) from your Firebase console.
   - Place the files in the appropriate directories:
     - Android: `android/app/`
     - iOS: `ios/Runner/`

### Optional

- Follow Google Maps and Stripe's integration guides to enable their features.

## Contributing
Contributions are welcomed! Feel free to fork the repository and submit a pull request. Follow the contribution guidelines provided in the repository.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.
