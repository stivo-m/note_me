import 'package:flutter/material.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // TODO(stivo-m): Uncomment when needed
  // final dynamic routeArgs = settings.arguments;

  switch (settings.name) {
    case AppRoutes.defaultRoute:
      return MaterialPageRoute<Placeholder>(
        builder: (_) => const Placeholder(),
      );
    case AppRoutes.dashboardRoute:
      return MaterialPageRoute<Placeholder>(
        builder: (_) => const Placeholder(),
      );
    default:
      return MaterialPageRoute<Placeholder>(
        builder: (_) => const Placeholder(),
      );
  }
}
