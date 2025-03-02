# World Time App

A simple Flutter app that displays the current time of different locations worldwide.

## Features

- Fetches current time from an API
- Displays day/night background based on time
- Allows users to select different locations

## Getting Started

### Prerequisites

- Ensure you have Flutter installed. You can check by running:
```sh
flutter --version
```
If not installed, follow the Flutter installation guide.

### Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/sreyas-b-anand/world_time_app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd world_time_app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```

### Running the App

To run the app on an emulator or a physical device, use:
```sh
flutter run
```

## Folder Structure

```
world_time_app/
│-- lib/
│   ├── main.dart
│   ├── pages/
│   │   ├── home.dart
│   │   ├── choose_location.dart
|   |   ├── loading.dart
│   ├── services/
│   │   ├── world_time.dart
│   ├── components/
│       ├── styled_appbar.dart
│-- assets/
│   ├── day.jpeg
│   ├── night.jpeg
│-- pubspec.yaml
```

## API Used

This app uses the [Time API](https://timeapi.io/) to fetch the current time based on the selected timezone.

## Common Issues

### Images Not Displaying
- Ensure images are added inside the `assets/` folder.
- Add the assets path in `pubspec.yaml`:
  ```yaml
  flutter:
    assets:
      - assets/day.jpeg
      - assets/night.jpeg
  ```
- Run:
  ```sh
  flutter pub get
  ```

### Platform Folders Not Tracked in Git

To avoid unnecessary files in Git, make sure `.gitignore` contains:
```
android/
ios/
macos/
windows/
linux/
web/
build/
```

## License

This project is licensed under the MIT License.