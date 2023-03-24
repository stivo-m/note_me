import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/bin/bootstrap/router/route_generator.dart';
import 'package:note_it/bin/bootstrap/themes/app_themes.dart';

Future<void> buildTestWidget({
  required WidgetTester tester,
  required Widget child,
  AppContext appContext = AppContext.development,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: appContext != AppContext.production,
      theme: AppTheme.lightTheme(),
      home: Material(child: child),
      onGenerateRoute: generateRoute,
      // navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
    ),
  );
}

typedef Callback = void Function(MethodCall call);
