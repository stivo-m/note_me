import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/states/note_state/note_state.dart';

void main() {
  group('AppState ', () {
    test(
      'should have an initial state',
      () {
        AppState appState = AppState.initial();
        expect(appState, isA<AppState>());
        expect(appState.noteState, NoteState.initial());
      },
    );

    test(
      'should convert to json',
      () {
        final Map<String, dynamic> stateMap = AppState.initial().toJson();
        expect(stateMap, isA<Map<String, dynamic>>());
        expect(stateMap.containsKey('noteState'), true);
      },
    );

    test(
      'should convert from json',
      () {
        final Map<String, dynamic> stateMap = jsonDecode(
          jsonEncode(AppState.initial().toMap()),
        );
        expect(stateMap, isA<Map<String, dynamic>>());
        expect(stateMap.containsKey('noteState'), true);

        final AppState appState = AppState.fromJson(stateMap);
        expect(appState, isA<AppState>());
        expect(appState.noteState, NoteState.initial());
      },
    );

    test(
      'should toMap',
      () {
        final Map<String, dynamic> stateMap = jsonDecode(
          jsonEncode(AppState.initial().toMap()),
        );
        expect(stateMap, isA<Map<String, dynamic>>());
        expect(stateMap.containsKey('noteState'), true);

        final AppState appState = AppState.fromJson(stateMap);
        expect(appState, isA<AppState>());
        expect(appState.noteState, NoteState.initial());
      },
    );
  });
}
