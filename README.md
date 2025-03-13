# vimag_pex_app

Flutter application that integrates with the Pexels API to allow users to search for photos and videos. 

It uses:

- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) to load environment variables.
- [http](https://pub.dev/packages/http) for network requests.
- [video_player](https://pub.dev/packages/video_player) for video playback.

## Features

- Search for images and videos by keyword.
- Display results in separate tabs for photos and videos.
- Uses a `.env` file for secure storage and loading of API keys.

## Getting Started

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Add your API key in a `.env` file at the project root, for example:
   ```
   PEXELS_API_KEY=YOUR_PEXELS_API_KEY
   ```
4. Run `flutter run` to start the app.
