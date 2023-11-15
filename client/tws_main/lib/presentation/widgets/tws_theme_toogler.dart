import 'package:cosmos_foundation/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:tws_main/business/services/client/theme_client_service.dart';
import 'package:tws_main/constants/config/theme/light_theme.dart';
import 'package:tws_main/constants/config/theme/theme_base.dart';
import 'package:tws_main/constants/theme_constants.dart';
import 'package:tws_main/presentation/widgets/tws_toogle_rounded_button.dart';

// --> Services
/// Internal [ThemeClientService] service reference.
final ThemeClientService _themeCS = ThemeClientService.i;

/// Public Widget to draw a theme toogler button.
///
/// This widget draws a default template for theme toogler and all its behavior to control the theme decission.
class TwsThemeToogler extends StatefulWidget {
  /// Defines in a top level if the button should display its tooltip.
  final bool tooltip;

  /// Will create and instance a public widget for a theme toogler button.
  const TwsThemeToogler({
    super.key,
    this.tooltip = false,
  });

  @override
  State<TwsThemeToogler> createState() => _TwsThemeTooglerState();
}

class _TwsThemeTooglerState extends State<TwsThemeToogler> {
  // --> State
  late bool currentIsLight;
  late TWSThemeBase currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = getTheme(
      updateEfect: updateThemeEffect,
    );
    currentIsLight = currentTheme.runtimeType == TWSLightTheme;
  }

  @override
  void dispose() {
    disposeGetTheme(updateThemeEffect);
    super.dispose();
  }

  /// Function triggered when the theme changer manager notifies and updateEffect.
  void updateThemeEffect() {
    setState(
      () => currentTheme = getTheme(),
    );
  }

  /// Switches the theme of the application based on the current toogler state.
  void switchThemeOption() {
    setState(() {
      currentIsLight = !currentIsLight;
    });
    _themeCS.updateCurrentTheme(!currentIsLight ? darkThemeIdentifier : lightThemeIdentifier);
  }

  @override
  Widget build(BuildContext context) {
    return ToogleRoundedButton(
      icon: !currentIsLight ? Icons.light_mode : Icons.dark_mode,
      onFire: switchThemeOption,
      toolTip: !widget.tooltip ? '' : 'Toogle the theme to ${currentIsLight ? 'dark theme' : 'light theme'}',
    );
  }
}
