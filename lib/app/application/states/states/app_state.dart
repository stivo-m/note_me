// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_it/app/application/states/states/note_state/note_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    NoteState? noteState,
    ThemeMode? themeMode,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        noteState: NoteState.initial(),
        themeMode: ThemeMode.dark,
      );
}
