import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/home_screen.dart';

/// The main entry point for the Flutter application.
///
/// Loads environment variables from the `.env` file and runs the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env before runApp()
  try {
    await dotenv.load(fileName: ".env"); // Load environment variables
  } catch (e) {
    throw Exception('Error loading .env file: $e'); // Print error if any
  }

  runApp(const MyApp());
}

/// The root widget of the application, setting up a [MaterialApp].
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  /// Builds the main UI structure for the app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Photos & Videos',
      home: Scaffold(
        appBar: AppBar(title: const Text('Search Photos & Videos')),
        body: const HomeScreen(),
      ),
    );
  }
}
