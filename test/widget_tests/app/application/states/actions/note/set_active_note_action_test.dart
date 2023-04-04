import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/actions/notes/set_active_note_action.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../test_helpers/build_test_widget.dart';

void main() {
  group('SetActiveNoteAction - ', () {
    testWidgets(
      'should set a note active on the state',
      (WidgetTester tester) async {
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial().copyWith.noteState!.call(
                allNotes: mockNotes,
              ),
        );

        final String id = mockNotes.first.id;

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: RawMaterialButton(
            onPressed: () {
              storeTester.dispatch(
                SetActiveNoteAction(id: id),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder btn = find.byType(RawMaterialButton);

        expect(btn, findsOneWidget);
        expect(storeTester.state.noteState?.activeNote, null);

        await tester.tap(btn);
        await tester.pumpAndSettle();

        expect(storeTester.state.noteState?.allNotes?.isEmpty, false);
        final NoteEntity? activeNote = storeTester.state.noteState?.activeNote;

        expect(activeNote, isNotNull);
        expect(activeNote?.title, mockNotes.first.title);
      },
    );

    testWidgets(
      'should return default state when passed id is invalid',
      (WidgetTester tester) async {
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial().copyWith.noteState!.call(
                allNotes: mockNotes,
              ),
        );

        final String id = 'some-random-id';

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: RawMaterialButton(
            onPressed: () {
              storeTester.dispatch(
                SetActiveNoteAction(id: id),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder btn = find.byType(RawMaterialButton);

        expect(btn, findsOneWidget);
        expect(storeTester.state.noteState?.activeNote, null);

        await tester.tap(btn);
        await tester.pumpAndSettle();

        expect(storeTester.state.noteState?.activeNote, null);
      },
    );
  });
}
