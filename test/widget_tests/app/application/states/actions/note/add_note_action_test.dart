import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/actions/notes/add_note_action.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

import '../../../../../../test_helpers/build_test_widget.dart';

void main() {
  group('AddNoteAction - ', () {
    testWidgets(
      'should add a note to the state',
      (WidgetTester tester) async {
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial(),
        );

        final String testTitle = 'Title';
        final String testBody = 'TestBody';

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: RawMaterialButton(
            onPressed: () {
              storeTester.dispatch(
                AddNoteAction(title: testTitle, body: testBody),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder btn = find.byType(RawMaterialButton);

        expect(btn, findsOneWidget);
        expect(storeTester.state.noteState?.allNotes?.isEmpty, true);

        await tester.tap(btn);
        await tester.pumpAndSettle();

        final NoteEntity? noteEntity =
            storeTester.state.noteState?.allNotes?.first;

        expect(storeTester.state.noteState?.allNotes?.isEmpty, false);
        expect(noteEntity, isNotNull);
        expect(noteEntity?.title, testTitle);
        expect(noteEntity?.body, testBody);
      },
    );
  });
}
