import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

        final MaterialPageRoute<Placeholder> route =
            routeGenerator(settings) as MaterialPageRoute<Placeholder>;

        expect(route, isA<MaterialPageRoute<Placeholder>>());
        expect(route.builder(context), isA<Placeholder>());
      });

      test('returns dashboard page', () {
        const RouteSettings settings = RouteSettings(
          name: AppRoutes.dashboardRoute,
        );

        final MaterialPageRoute<Placeholder> route =
            routeGenerator(settings) as MaterialPageRoute<Placeholder>;

        expect(route, isA<MaterialPageRoute<Placeholder>>());
        expect(route.builder(context), isA<Placeholder>());
      });
    },
  );
}
