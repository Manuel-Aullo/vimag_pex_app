// design_tokens.dart
import 'package:flutter/material.dart';

/// Global design tokens for semantic colors.
/// These colors are used throughout the app to maintain a consistent look and feel.
/// The colors are categorized into light and dark themes.
/// Light Theme Colors
class LightThemeColors {
  // Background
  static const Color backgroundPrimary = Color(0xFFFFFDF6); // off-white
  static const Color backgroundSecondary = Color(0xFFEEEEEE); // grey-200
  static const Color backgroundDisabled = Color(0xFFF7F7F7); // grey-100
  static const Color backgroundError = Color(0xFFFFE6E6); // red-100
  static const Color backgroundHoverDefault = Color(0xFFDDDDDD); // grey-300
  static const Color backgroundHoverInverse = Color(0xFF1A237E); // blue-850
  static const Color backgroundSelected = Color(0xFFB3E5FC); // blue-200
  static const Color backgroundPopover = Color(0xFFFFFDF6); // off-white

  // Button
  static const Color backgroundButtonPrimaryDefault = Color(
    0xFF2563EB,
  ); // blue-600
  static const Color backgroundButtonPrimaryHover = Color(
    0xFF1D4ED8,
  ); // blue-700
  static const Color backgroundButtonPrimaryActive = Color(
    0xFF3B82F6,
  ); // blue-500
  static const Color backgroundButtonInverseDefault = Color(
    0xFF101010,
  ); // off-black
  static const Color backgroundButtonDangerDefault = Color(
    0xFFD32F2F,
  ); // red-600
  static const Color backgroundButtonDangerHover = Color(0xFFC62828); // red-700
  static const Color backgroundButtonDangerActive = Color(
    0xFFE53935,
  ); // red-500
  static const Color backgroundButtonMarketingDefault = Colors.white;
  static const Color backgroundButtonMarketingHover = Color(
    0xFFCCCCCC,
  ); // grey-300
  static const Color backgroundButtonDisabled = Color(0xFFCCCCCC); // grey-300

  // Status
  static const Color backgroundStatusDefaultStrong = Color(
    0xFF757575,
  ); // grey-600
  static const Color backgroundStatusInfoStrong = Color(0xFF1E88E5); // blue-800
  static const Color backgroundStatusSuccessStrong = Color(
    0xFF2E7D32,
  ); // green-600
  static const Color backgroundStatusWarningStrong = Color(
    0xFFFBC02D,
  ); // yellow-600
  static const Color backgroundStatusErrorStrong = Color(0xFFD32F2F); // red-600
  static const Color backgroundStatusAttentionStrong = Color(
    0xFFE53935,
  ); // red-500
  static const Color backgroundStatusDiscountStrong = Color(
    0xFFFFEE58,
  ); // yellow-400
  static const Color backgroundStatus5GStrong = Color(0xFF0D47A1); // brand-blue
  static const Color backgroundStatusDefaultSubtle = Color(
    0xFFEEEEEE,
  ); // grey-300
  static const Color backgroundStatusInfoSubtle = Color(0xFF90CAF9); // blue-300
  static const Color backgroundStatusSuccessSubtle = Color(
    0xFFA5D6A7,
  ); // green-200
  static const Color backgroundStatusWarningSubtle = Color(
    0xFFFFF176,
  ); // yellow-300
  static const Color backgroundStatusErrorSubtle = Color(0xFFEF9A9A); // red-300
  static const Color backgroundStatusAttentionSubtle = Color(
    0xFFFFCDD2,
  ); // red-200
  static const Color backgroundStatusDiscountSubtle = Color(
    0xFFFFF9C4,
  ); // yellow-200
  static const Color backgroundStatus5GSubtle = Color(0xFFB3E5FC); // blue-200

  // In-line notification
  static const Color backgroundInlineDefault = Color(0xFFEEEEEE); // grey-200
  static const Color backgroundInlineInfo = Color(0xFFBBDEFB); // blue-100
  static const Color backgroundInlineSuccess = Color(0xFFC8E6C9); // green-100
  static const Color backgroundInlineWarning = Color(0xFFFFF9C4); // yellow-100
  static const Color backgroundInlineError = Color(0xFFFFCDD2); // red-100

  // Text and Icon
  static const Color textDefault = Color(0xFF1E88E5); // blue-800
  static const Color textInverse = Colors.white;
  static const Color textBrand = Color(0xFF0D47A1); // brand-blue
  static const Color textStrong = Colors.black;
  static const Color textDiscount = Colors.black;
  static const Color textHelp = Color(0xFF757575); // grey-600
  static const Color textDisabled = Color(0xFF9E9E9E); // grey-500
  static const Color textError = Color(0xFFD32F2F); // red-600
  static const Color textAction = Color(0xFF2563EB); // blue-600
  static const Color textButtonPrimary = Colors.white;
  static const Color textButtonSecondaryActive = Color(0xFF1D4ED8); // blue-700
  static const Color textButtonSecondaryInverse = Color(0xFFBBDEFB); // blue-100
  static const Color textButtonSecondaryInverseActive = Color(
    0xFF90CAF9,
  ); // blue-300
  static const Color textButtonMarketing = Color(0xFF0D47A1); // brand-blue
  static const Color textButtonDisabled = Color(0xFF9E9E9E); // grey-500

  // Border
  static const Color borderStrong = Color(0xFF1E88E5); // blue-800
  static const Color borderSubtle = Color(0xFF9E9E9E); // grey-500
  static const Color borderWeak = Color(0xFFBDBDBD); // grey-400
  static const Color borderSelected = Color(0xFF2563EB); // blue-600
  static const Color borderInformation = Color(0xFF2563EB); // blue-600
  static const Color borderSuccess = Color(0xFF2E7D32); // green-600
  static const Color borderWarning = Color(0xFFFBC02D); // yellow-400
  static const Color borderError = Color(0xFFD32F2F); // red-600
}

/// Dark Theme Colors
class DarkThemeColors {
  // Background
  static const Color backgroundPrimary = Color(0xFF001F3F); // dark-blue
  static const Color backgroundSecondary = Color(0xFF0A0A23); // blue-900
  static const Color backgroundDisabled = Color(0xFF000B1C); // blue-950
  static const Color backgroundError = Color(0xFFB71C1C); // red-800
  static const Color backgroundHoverDefault = Color(0xFF0D47A1); // blue-850
  static const Color backgroundHoverInverse = Color(0xFFB3E5FC); // grey-300
  static const Color backgroundSelected = Color(0xFF0D47A1); // blue-800
  static const Color backgroundPopover = Color(0xFF0D47A1); // blue-800

  // Button
  static const Color backgroundButtonPrimaryDefault = Color(
    0xFF2563EB,
  ); // blue-600
  static const Color backgroundButtonPrimaryHover = Color(
    0xFF1D4ED8,
  ); // blue-700
  static const Color backgroundButtonPrimaryActive = Color(
    0xFF3B82F6,
  ); // blue-500
  static const Color backgroundButtonInverseDefault = Colors.white; // off-white
  static const Color backgroundButtonDangerDefault = Color(
    0xFFD32F2F,
  ); // red-600
  static const Color backgroundButtonDangerHover = Color(0xFFC62828); // red-700
  static const Color backgroundButtonDangerActive = Color(
    0xFFE53935,
  ); // red-500
  static const Color backgroundButtonMarketingDefault = Colors.white;
  static const Color backgroundButtonMarketingHover = Color(
    0xFF999999,
  ); // grey-400
  static const Color backgroundButtonDisabled = Color(0xFF757575); // grey-700

  // Status
  static const Color backgroundStatusDefaultStrong = Color(
    0xFFB3B3B3,
  ); // grey-300
  static const Color backgroundStatusInfoStrong = Color(0xFF90CAF9); // blue-300
  static const Color backgroundStatusSuccessStrong = Color(
    0xFFA5D6A7,
  ); // green-200
  static const Color backgroundStatusWarningStrong = Color(
    0xFFBDBDBD,
  ); // yellow-300
  static const Color backgroundStatusErrorStrong = Color(0xFFB71C1C); // red-300
  static const Color backgroundStatusAttentionStrong = Color(
    0xFFFFCDD2,
  ); // red-200
  static const Color backgroundStatusDiscountStrong = Color(
    0xFFFFF176,
  ); // yellow-200
  static const Color backgroundStatus5GStrong = Color(0xFFBBDEFB); // blue-200
  static const Color backgroundStatusDefaultSubtle = Color(
    0xFF757575,
  ); // grey-600
  static const Color backgroundStatusInfoSubtle = Color(0xFF1E88E5); // blue-800
  static const Color backgroundStatusSuccessSubtle = Color(
    0xFF2E7D32,
  ); // green-600
  static const Color backgroundStatusWarningSubtle = Color(
    0xFFFBC02D,
  ); // yellow-600
  static const Color backgroundStatusErrorSubtle = Color(0xFFD32F2F); // red-600
  static const Color backgroundStatusAttentionSubtle = Color(
    0xFFE53935,
  ); // red-500
  static const Color backgroundStatusDiscountSubtle = Color(
    0xFFFFF9C4,
  ); // yellow-400
  static const Color backgroundStatus5GSubtle = Color(0xFF0D47A1); // brand-blue

  // In-line notification
  static const Color backgroundInlineDefault = Color(0xFF424242); // grey-800
  static const Color backgroundInlineInfo = Color(0xFF0D47A1); // blue-800
  static const Color backgroundInlineSuccess = Color(0xFF2E7D32); // green-800
  static const Color backgroundInlineWarning = Color(0xFFFBC02D); // yellow-800
  static const Color backgroundInlineError = Color(0xFFD32F2F); // red-800

  // Text and Icon
  static const Color textDefault = Color(0xFFBBDEFB); // blue-100
  static const Color textInverse = Colors.black;
  static const Color textBrand = Colors.white;
  static const Color textStrong = Colors.white;
  static const Color textDiscount = Colors.black;
  static const Color textHelp = Color(0xFFBDBDBD); // grey-400
  static const Color textDisabled = Color(0xFF757575); // grey-600
  static const Color textError = Color(0xFFEF9A9A); // red-400
  static const Color textAction = Color(0xFF90CAF9); // blue-400
  static const Color textButtonPrimary = Colors.white;
  static const Color textButtonSecondaryActive = Color(0xFF1D4ED8); // blue-300
  static const Color textButtonSecondaryInverse = Color(0xFF1E88E5); // blue-800
  static const Color textButtonSecondaryInverseActive = Color(
    0xFF1565C0,
  ); // blue-700
  static const Color textButtonMarketing = Color(0xFF0D47A1); // brand-blue
  static const Color textButtonDisabled = Color(0xFF757575); // grey-400

  // Border
  static const Color borderStrong = Color(0xFFBBDEFB); // blue-100
  static const Color borderSubtle = Color(0xFF9E9E9E); // grey-500
  static const Color borderWeak = Color(0xFF757575); // grey-700
  static const Color borderSelected = Color(0xFF90CAF9); // blue-400
  static const Color borderInformation = Color(0xFF90CAF9); // blue-400
  static const Color borderSuccess = Color(0xFFA5D6A7); // green-400
  static const Color borderWarning = Color(0xFFBDBDBD); // yellow-300
  static const Color borderError = Color(0xFFEF9A9A); // red-400
}

/// Generates a [MaterialColor] based on the given [color].
///
/// This function creates a dynamic color swatch by computing multiple
/// color shades from the base [color]. It uses several pre-defined intensity
/// values (strengths) to generate lighter or darker variations of the base color.
///
/// The resulting [MaterialColor] can be used throughout the theming system where
/// a swatch of color shades is required (e.g., for a primary swatch).
///
/// The conversion of the [color] to its ARGB integer form is done via the
/// [toARGB32] method. Make sure this method is defined as an extension or function,
/// otherwise replace it with the appropriate conversion.
///
/// Example:
/// ```dart
/// MaterialColor customSwatch = createMaterialColor(const Color(0xFF3B82F6));
/// ```
///
/// [color]: The base color from which to generate the swatch.
///
/// Returns a [MaterialColor] that contains a mapping of intensity keys to color shades.
MaterialColor createMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int r = color.r.toInt(), g = color.g.toInt(), b = color.b.toInt();

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (double strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.toARGB32(), swatch);
}
