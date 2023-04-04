import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/actions/notes/update_note_action.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../test_helpers/build_test_widget.dart';

void main() {
  group('UpdateNoteAction - ', () {
    testWidgets(
      'should update a note from the state',
      (WidgetTester tester) async {
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial().copyWith.noteState!.call(
            allNotes: <NoteEntity>[mockNotes.first],
          ),
        );

        final String id = mockNotes.first.id;
        final String updatedTitle = 'Updated Note Title';

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: RawMaterialButton(
            onPressed: () {
              storeTester.dispatch(
                UpdateNoteAction(id: id, title: updatedTitle),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder btn = find.byType(RawMaterialButton);

        expect(btn, findsOneWidget);
        expect(storeTester.state.noteState?.allNotes?.isEmpty, false);

        await tester.tap(btn);
        await tester.pumpAndSettle();

        expect(storeTester.state.noteState?.allNotes?.isEmpty, false);
        final NoteEntity? noteEntity =
            storeTester.state.noteState?.allNotes?.first;

        expect(noteEntity, isNotNull);
        expect(noteEntity?.title, updatedTitle);
      },
    );

    testWidgets(
      'should not update the note if the id passed is invalid',
      (WidgetTester tester) async {
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial().copyWith.noteState!.call(
            allNotes: <NoteEntity>[mockNotes.first],
          ),
        );

        final String id = 'some-random-id-here';
        final String updatedTitle = 'Updated Note Title';

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: RawMaterialButton(
            onPressed: () {
              storeTester.dispatch(
                UpdateNoteAction(id: id, title: updatedTitle),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder btn = find.byType(RawMaterialButton);

        expect(btn, findsOneWidget);
        expect(storeTester.state.noteState?.allNotes?.isEmpty, false);

        await tester.tap(btn);
        await tester.pumpAndSettle();

        expect(storeTester.state.noteState?.allNotes?.isEmpty, false);
        final NoteEntity? noteEntity =
            storeTester.state.noteState?.allNotes?.first;

        expect(noteEntity, isNotNull);
        expect(noteEntity?.title, isNot(updatedTitle));
      },
    );
  });
}
