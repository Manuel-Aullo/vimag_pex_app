import 'package:flutter/material.dart';

/// A function to get the appropriate theme data based on the current mode.
/// Returns a [ThemeData] object for the specified [mode].
class ThemeProvider with ChangeNotifier {
  /// Returns the appropriate theme data based on the current mode.
  /// If the mode is [ThemeMode.light], returns a light theme.
  /// If the mode is [ThemeMode.dark], returns a dark theme.
  /// If the mode is [ThemeMode.system], returns the system theme.
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeProvider({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleTheme() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
