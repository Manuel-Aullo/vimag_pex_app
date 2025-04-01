import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Imports the theme provider for managing light/dark mode.
import './providers/theme_provider.dart';

/// Importing home screen
import 'screens/home_screen.dart';

import './widgets/toggle_button.dart';

/// The main entry point for the Flutter application.
///
/// This method initializes Flutter bindings, loads environment variables
/// from the `.env` file, and runs the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables before running the application.
  try {
    await dotenv.load(fileName: ".env"); // Load environment variables
  } catch (e) {
    // Throw an exception if loading fails.
    throw Exception('Error loading .env file: $e');
  }

  runApp(const MyApp());
}

/// The root widget of the application.
///
/// This widget sets up global providers and the MaterialApp with theme
/// configurations for both light and dark modes.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  /// Builds the main UI structure for the app.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Provides global state (e.g., theme) to the widget tree.
      providers: [ChangeNotifierProvider(create: (ctx) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder:
            (context, themeObject, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Search Photos & Videos',
              themeMode: themeObject.mode,
              theme: ThemeData(
                // Light theme configuration.
                brightness: Brightness.light,
                primarySwatch: Colors.deepPurple,
                primaryColor: Colors.deepPurpleAccent,
                colorScheme: ColorScheme.fromSwatch(
                  brightness: Brightness.light,
                ).copyWith(secondary: Colors.amber[700]),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ),
              darkTheme: ThemeData(
                // Dark theme configuration.
                brightness: Brightness.dark,
                primaryColor: Colors.blue[300],
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                colorScheme: ColorScheme.fromSwatch(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.blue,
                ).copyWith(secondary: Colors.amber),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Scaffold(
                // Defines the main app scaffold with AppBar and HomeScreen body.
                appBar: AppBar(
                  title: const Text('Search Photos & Videos'),
                  actions: [
                    // Toggle button for switching between light and dark modes.
                    ToggleButton(
                      iconBackgroundColor: Colors.transparent,
                      onToggle: () {
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).toggleTheme();
                      },
                    ),
                  ],
                ),
                body: const HomeScreen(),
              ),
            ),
      ),
    );
  }
}
