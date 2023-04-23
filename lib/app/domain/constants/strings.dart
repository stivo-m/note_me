import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/enums.dart';

class AppStrings {
  static String getDatabaseName(AppContext appContext) {
    final String suffix = describeEnum(appContext);
    return 'com.note_me.app.store-04.${suffix}-${AppStrings.appVersion}.db';
  }

  static const String appTitle = 'Note IT';
  static const String appVersion =
      String.fromEnvironment('APP_VERSION', defaultValue: '1.0.0-dev');
  static const String appVersionText = 'Version: $appVersion';

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
  static const String defaultBodyHintText =
      'You can enter all your notes here...';
  static const String saveText = 'Save';
  static const String changeThemeText = 'Change Theme';
  static const String aboutDeveloperText = 'About the developer';
  static const String aboutDeveloperDesc = 'Developer profile | Social Links ';
  static const String developerName = 'Steven Maina - ';
  static const String developerDesignation = 'Senior Software Engineer';
  static const String profileImageUrl =
      'https://avatars.githubusercontent.com/u/52053291?s=400&u=1b99f2e588d8092fa88a58e6172bad268b625e50&v=4';

  static const String aboutDeveloper =
      'As a Self-taught Senior Frontend Engineer with over 4 years of professional employment and development experience,\n\nI am skilled in implementing GraphQL on the frontend, as well as Redux for state management on both mobile and the web';

  static const String whatssappText = 'Whatsapp Me';
  static const String whatssappDescText =
      'Reach out directly to me via Whatsapp';
  static const String whatssappLink = 'https://wa.me/+254714725468';

  static const String linkedinText = 'Linkedin';
  static const String linkedinDescText = 'Get in touch through LinkedIn';
  static const String linkedinLink =
      'https://www.linkedin.com/in/steven-maina-966432172/';
  static const String twitterinText = 'Twitter';
  static const String twitterinDescText = 'Send me a DM via Twitter';
  static const String twitterinLink = 'https://twitter.com/StevenM22484877';
}
