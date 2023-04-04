import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/actions/notes/reset_active_note_action.dart';
import 'package:note_it/app/application/states/states/app_state.dart';

import '../../../../../../mocks/mocks.dart';
import '../../../../../../test_helpers/build_test_widget.dart';

void main() {
  group('ResetActiveNoteAction - ', () {
    testWidgets(
      'should reset the active note on state',
      (WidgetTester tester) async {
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial().copyWith.noteState!.call(
                allNotes: mockNotes,
                activeNote: mockNotes.first,
              ),
        );

        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: RawMaterialButton(
            onPressed: () {
              storeTester.dispatch(ResetActiveNoteAction());
            },
          ),
        );

        await tester.pumpAndSettle();

        final Finder btn = find.byType(RawMaterialButton);

        expect(btn, findsOneWidget);
        expect(storeTester.state.noteState?.activeNote, isNotNull);

        await tester.tap(btn);
        await tester.pumpAndSettle();

        expect(storeTester.state.noteState?.activeNote, isNull);
      },
    );
  });
}
