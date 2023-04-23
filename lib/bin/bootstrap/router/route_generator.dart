import 'package:flutter/material.dart';
import 'package:note_it/app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:note_it/app/presentation/pages/dashboard/note_editor/note_editor_page.dart';
import 'package:note_it/app/presentation/pages/settings/developer_profile.dart';
import 'package:note_it/app/presentation/pages/settings/settings_page.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // TODO(stivo-m): Uncomment when needed
  // final dynamic routeArgs = settings.arguments;

  switch (settings.name) {
    case AppRoutes.dashboardRoute:
      return MaterialPageRoute<DashboardPage>(
        builder: (_) => const DashboardPage(),
      );
    case AppRoutes.settingsRoute:
      return MaterialPageRoute<SettingsPage>(
        builder: (_) => const SettingsPage(),
      );
    case AppRoutes.noteEditorRoute:
      return MaterialPageRoute<NoteEditorPage>(
        builder: (_) => const NoteEditorPage(),
      );
    case AppRoutes.developerProfileRoute:
      return MaterialPageRoute<DeveloperProfilePage>(
        builder: (_) => const DeveloperProfilePage(),
      );
    default:
      return MaterialPageRoute<DashboardPage>(
        builder: (_) => const DashboardPage(),
      );
  }
}
