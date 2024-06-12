# Take My Tym - (User App)

![take-my-tym-cover](https://raw.githubusercontent.com/sugith10/images/main/projects/take-my-tym-cover.png)

## Description
Take My Tym is a unique mobile application fully built using Flutter. It is designed to empower individuals by enabling them to efficiently sell and buy skills based on their available time. The platform aims to streamline the process of finding and managing freelance projects by creating a dynamic marketplace centered around time as a valuable commodity. With an intuitive interface and a rich set of features, Take My Tym bridges the gap between those seeking specific services and those willing to offer their skills.

## Table of Contents
- [take\_my\_tym](#take_my_tym)
  - [Description](#description)
  - [Table of Contents](#table-of-contents)
  - [Usage](#usage)
  - [Features](#features)
    - [Key Files](#key-files)
    - [Core Details](#core-details)
    - [Feature Modules](#feature-modules)
    - [Supporting Files](#supporting-files)
  - [Contributing](#contributing)
  - [License](#license)

## Usage
To try out the application, you can go to the Amazon App Store and search for "Take My Tym" or click the given [link here](#).

## Features
The project is done using a clean architecture, feature-first approach. Each feature is a separate module. Understanding the project structure is crucial:
  
### Key Files
- **main.dart**: Entry point of the project.
- **app.dart**: Handles root-level bloc provider.
- **app_view.dart**: Sets up the MaterialApp.

### Core Details
- **assets**: Contains images, fonts, and other assets used throughout the project.
- **bloc**: The blocs used throughout the modules.
- **const**: Contains constants like default padding, radius, etc.
- **di**: Dependency injection using GetIt.
- **model**: Core models used throughout the project.
- **observer**: Logger, bloc observer, route observer.
- **route**: Manages the application routes.
- **theme**: Application theme.
- **utils**: Utility functions, helpers, and common methods.
- **widgets**: Reusable UI components.

### Feature Modules
Each module follows clean architecture (data, domain, presentation):
- **auth**:
- **contract**: 
- **create_post**: 
- **home**:
- **message**: 
- **navigation_menu**: 
- **notification**:
- **onboarding**: 
- **profile**: 
- **proposal**:
- **search**: 
- **success**: 
- **view_post**: 
- **wallet**: 

### Supporting Files
- **firebase_options.dart**: Firebase configuration (git-ignored).
- **.env**: Environment variables for Google Map API key, Stripe publish key, and secret key (git-ignored).

To run the project, set up your Firebase project with Firebase Auth, Firestore, Firestore Database, and Analytics. Create a `.env` file in the root folder with the following content:

```
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
STRIPE_SECRET_KEY=your_stripe_secret_key
```

## Contributing
Contributions are welcomed for the project. Create a git fork and follow the installation guide.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.
