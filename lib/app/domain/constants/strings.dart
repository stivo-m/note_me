import 'package:flutter/material.dart';

class AppStrings {
  static const String appTitle = 'Note IT';
  static const String appVersion =
      String.fromEnvironment('APP_VERSION', defaultValue: '1.0.0-dev');
  static const String notesTitle = 'My Notes';
  static const String settingsTitle = 'Settings';
  static String switchToTheme(ThemeMode themeMode) {
    return 'Switch to ${themeMode.name} theme';
  }

  static const String searchHintText = 'Search anything here...';
  static const String noItemsToDisplay = 'There are no items to display here';
  static const String featureComingSoonText = 'Feature coming soon...';
}
