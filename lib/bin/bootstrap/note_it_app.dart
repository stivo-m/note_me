import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/bin/bootstrap/router/route_generator.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';
import 'package:note_it/bin/bootstrap/themes/app_themes.dart';
import 'package:note_it/bin/bootstrap/themes/colors.dart';

class NoteItApp extends StatelessWidget {
  const NoteItApp({super.key, this.appContext = AppContext.development});

  final AppContext appContext;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      initialRoute: AppRoutes.defaultRoute,
      onGenerateRoute: generateRoute,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      color: AppColors.primaryGreenColor,
    );
  }
}
