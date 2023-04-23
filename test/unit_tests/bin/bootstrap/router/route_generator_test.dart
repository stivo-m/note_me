import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:note_it/app/presentation/pages/dashboard/note_editor/note_editor_page.dart';
import 'package:note_it/app/presentation/pages/settings/developer_profile.dart';
import 'package:note_it/app/presentation/pages/settings/settings_page.dart';
import 'package:note_it/bin/bootstrap/router/route_generator.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';

import '../../../../mocks/mocks.dart';

void main() {
  const Route<dynamic> Function(RouteSettings settings) routeGenerator =
      generateRoute;
  final BuildContext context = MockBuildContext();
  group(
    'Route Generator Tests - ',
    () {
      test('returns default page', () {
        const RouteSettings settings = RouteSettings();

        final MaterialPageRoute<DashboardPage> route =
            routeGenerator(settings) as MaterialPageRoute<DashboardPage>;

        expect(route, isA<MaterialPageRoute<DashboardPage>>());
        expect(route.builder(context), isA<DashboardPage>());
      });

      test('returns dashboard page', () {
        const RouteSettings settings = RouteSettings(
          name: AppRoutes.dashboardRoute,
        );

        final MaterialPageRoute<DashboardPage> route =
            routeGenerator(settings) as MaterialPageRoute<DashboardPage>;

        expect(route, isA<MaterialPageRoute<DashboardPage>>());
        expect(route.builder(context), isA<DashboardPage>());
      });

      test('returns settings page', () {
        const RouteSettings settings = RouteSettings(
          name: AppRoutes.settingsRoute,
        );

        final MaterialPageRoute<SettingsPage> route =
            routeGenerator(settings) as MaterialPageRoute<SettingsPage>;

        expect(route, isA<MaterialPageRoute<SettingsPage>>());
        expect(route.builder(context), isA<SettingsPage>());
      });

      test('returns note editor page', () {
        const RouteSettings settings = RouteSettings(
          name: AppRoutes.noteEditorRoute,
        );

        final MaterialPageRoute<NoteEditorPage> route =
            routeGenerator(settings) as MaterialPageRoute<NoteEditorPage>;

        expect(route, isA<MaterialPageRoute<NoteEditorPage>>());
        expect(route.builder(context), isA<NoteEditorPage>());
      });

      test('returns developer profile page', () {
        const RouteSettings settings = RouteSettings(
          name: AppRoutes.developerProfileRoute,
        );

        final MaterialPageRoute<DeveloperProfilePage> route =
            routeGenerator(settings) as MaterialPageRoute<DeveloperProfilePage>;

        expect(route, isA<MaterialPageRoute<DeveloperProfilePage>>());
        expect(route.builder(context), isA<DeveloperProfilePage>());
      });
    },
  );
}
