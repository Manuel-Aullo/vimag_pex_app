import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

/// A customizable toggle button widget which, in addition to
/// handling theme changes, transitions between two icons with an animation.
///
/// All style, sizing, and animation properties can be configured via
/// the constructor. The [iconTransition] property allows customizing
/// how the icon animates when switching between light and dark mode.
/// Additionally, you can pass custom icons for light and dark themes.
class ToggleButton extends StatefulWidget {
  /// Duration of all animations in the widget.
  final Duration animationDuration;

  /// Fraction of the screen width used for the outer container’s width.
  final double containerWidthFactor;

  /// Fraction of the screen height used for the outer container’s height.
  final double containerHeightFactor;

  /// The primary color for indicating the toggle’s active state.
  final Color activeColor;

  /// The secondary color for the icon.
  final Color iconBackgroundColor;

  /// The default transition for switching icons.
  final AnimatedSwitcherTransitionBuilder iconTransition;

  /// The initial state of the toggle.
  final bool initialValue;

  /// Optional callback invoked after the toggle is activated.
  final VoidCallback? onToggle;

  /// The icon to display when dark mode is enabled (i.e. the theme is dark,
  /// so the icon signals a switch to light mode). Defaults to [Icons.wb_sunny].
  final IconData onModeIcon;

  /// The icon to display when dark mode is disabled (i.e. the theme is light,
  /// so the icon signals a switch to dark mode). Defaults to [Icons.nightlight_round].
  final IconData offModeIcon;

  const ToggleButton({
    super.key,
    this.animationDuration = const Duration(milliseconds: 360),
    this.containerWidthFactor = 0.5,
    this.containerHeightFactor = 0.25,
    this.activeColor = const Color(0xffFFC209),
    this.iconBackgroundColor = const Color(0xff27173A),
    this.iconTransition = _defaultIconTransition,
    this.initialValue = false,
    this.onToggle,
    this.onModeIcon = Icons.light_mode_outlined,
    this.offModeIcon = Icons.dark_mode_outlined,
  });

  /// Default transition builder (a fade transition).
  static Widget _defaultIconTransition(
    Widget child,
    Animation<double> animation,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  // ignore: library_private_types_in_public_api
  _ThemeToggleButtonState createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ToggleButton> {
  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    final double outerWidth = s.width * widget.containerWidthFactor;
    final double outerHeight = s.height * widget.containerHeightFactor;

    // Determine the current icon based on the toggle state.
    // When _isOn is true, we assume dark mode is enabled,
    // so we display the icon meant to signal switching to light mode.
    final IconData iconData = _isOn ? widget.onModeIcon : widget.offModeIcon;

    return AnimatedContainer(
      duration: widget.animationDuration,
      width: outerWidth,
      height: outerHeight,
      color: Colors.transparent,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isOn = !_isOn;
            });
            if (widget.onToggle != null) {
              widget.onToggle!();
            }
          },
          child: Container(
            width: outerWidth / 2,
            height: outerWidth / 2, // Making a square container for the icon.
            decoration: BoxDecoration(
              color: widget.iconBackgroundColor,
              borderRadius: BorderRadius.circular(60),
            ),
            // AnimatedSwitcher transitions between the two icons using the provided iconTransition.
            child: AnimatedSwitcher(
              duration: widget.animationDuration,
              transitionBuilder: widget.iconTransition,
              child: Icon(
                iconData,
                key: ValueKey<bool>(_isOn),
                color: widget.activeColor,
                size: outerWidth / 6, // Adjust size as needed.
              ),
            ),
          ),
        ),
      ),
    );
  }
}
