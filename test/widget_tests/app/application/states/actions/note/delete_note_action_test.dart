import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/actions/notes/delete_note_action.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../test_helpers/build_test_widget.dart';

void main() {
  group('DeleteNoteAction - ', () {
    testWidgets(
      'should delete a note from the state',
      (WidgetTester tester) async {
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial().copyWith.noteState!.call(
            allNotes: <NoteEntity>[mockNotes.first],
          ),
        );

        final String id = mockNotes.first.id;

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: RawMaterialButton(
            onPressed: () {
              storeTester.dispatch(
                DeleteNoteAction(id: id),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder btn = find.byType(RawMaterialButton);

        expect(btn, findsOneWidget);
        expect(storeTester.state.noteState?.allNotes?.isNotEmpty, true);

        await tester.tap(btn);
        await tester.pumpAndSettle();

        expect(storeTester.state.noteState?.allNotes?.isEmpty, true);
      },
    );
  });
}
