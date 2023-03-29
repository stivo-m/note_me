import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/enums.dart';

class AppStrings {
  static String getDatabaseName(AppContext appContext) {
    final String suffix = describeEnum(appContext);
    return 'com.note_me.app.store-02.${suffix}-${AppStrings.appVersion}.db';
  }

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
  static const String createNoteText = 'Create a note...';
  static const String startTypingText = 'Start typing here...';
  static const String defaultTitle = 'My Note Title';
  static const String saveText = 'Save';
}
