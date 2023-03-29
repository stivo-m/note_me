// ignore: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_it/app/application/states/states/note_state/note_state.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/database_base.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    NoteState? noteState,
    @JsonKey(fromJson: fromJson) ThemeMode? themeMode,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        noteState: NoteState.initial(),
        themeMode: ThemeMode.dark,
      );
}

ThemeMode fromJson(dynamic target) {
  return ThemeMode.values.where((ThemeMode mode) {
    final String _mode = (target as Map<String, dynamic>).values.first;
    return describeEnum(mode).toLowerCase() == _mode.toLowerCase();
  }).first;
}

Map<String, String> toJson(ThemeMode mode) {
  return <String, String>{'mode': describeEnum(mode).toLowerCase()};
}

extension AppStateExt on AppState {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Tables.noteState.name: this.noteState,
      Tables.themeMode.name: toJson(this.themeMode ?? ThemeMode.system),
    };
  }
}
