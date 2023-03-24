import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/application/states/states/app_state.dart';

class UpdateThemeAction extends ReduxAction<AppState> {
  UpdateThemeAction(this.themeMode);

  final ThemeMode themeMode;

  @override
  AppState? reduce() {
    return state.copyWith.call(themeMode: themeMode);
  }
}
