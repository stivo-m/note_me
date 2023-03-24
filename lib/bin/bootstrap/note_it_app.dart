import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/view_models/theme_view_model.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/bin/bootstrap/router/route_generator.dart';
import 'package:note_it/bin/bootstrap/router/routes.dart';
import 'package:note_it/bin/bootstrap/themes/app_themes.dart';
import 'package:note_it/bin/bootstrap/themes/colors.dart';

class NoteItApp extends StatelessWidget {
  const NoteItApp({
    super.key,
    this.appContext = AppContext.development,
    this.store,
  });

  final AppContext appContext;
  final Store<AppState>? store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store ?? Store<AppState>(initialState: AppState.initial()),
      child: StoreConnector<AppState, ThemeViewModel>(
        converter: (Store<AppState> store) => ThemeViewModel.fromStore(store),
        builder: (BuildContext context, ThemeViewModel vm) {
          return MaterialApp(
            title: AppStrings.appTitle,
            initialRoute: AppRoutes.defaultRoute,
            onGenerateRoute: generateRoute,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: vm.themeMode,
            color: AppColors.primaryGreenColor,
          );
        },
      ),
    );
  }
}
