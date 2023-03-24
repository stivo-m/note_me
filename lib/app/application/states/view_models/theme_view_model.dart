import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/application/states/actions/theme/update_theme_action.dart';
import 'package:note_it/app/application/states/states/app_state.dart';

class ThemeViewModel {
  ThemeViewModel({
    required this.themeMode,
    required this.updateTheme,
  });

  final ThemeMode themeMode;
  final Function(ThemeMode) updateTheme;

  static ThemeViewModel fromStore(Store<AppState> store) {
    return ThemeViewModel(
      themeMode: store.state.themeMode ?? ThemeMode.system,
      updateTheme: (ThemeMode themeMode) {
        store.dispatch(UpdateThemeAction(themeMode));
      },
    );
  }
}
