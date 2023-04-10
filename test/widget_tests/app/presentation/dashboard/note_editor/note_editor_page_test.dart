import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/view_models/notes_view_mode.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/presentation/pages/dashboard/note_editor/note_editor_page.dart';

import '../../../../../mocks/mocks.dart';
import '../../../../../test_helpers/build_test_widget.dart';

void main() {
  group(
    'NoteEditorPage -',
    () {
      testWidgets(
        'should display properly',
        (WidgetTester tester) async {
          final StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial(),
          );

          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            child: const NoteEditorPage(),
          );
          await tester.pumpAndSettle();

          expect(find.byKey(WidgetKeys.markdownTitleKey), findsOneWidget);
          expect(find.byKey(WidgetKeys.markdownBodyKey), findsOneWidget);
          expect(find.byKey(WidgetKeys.markdownToolbarKey), findsOneWidget);
          expect(find.byKey(WidgetKeys.saveButtonKey), findsOneWidget);
          expect(find.byKey(WidgetKeys.backButtonKey), findsOneWidget);
        },
      );

      testWidgets(
        'should add a note',
        (WidgetTester tester) async {
          final StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial(),
          );

          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            child: StoreConnector<AppState, NotesViewModel>(
              converter: (Store<AppState> store) =>
                  NotesViewModel.fromStore(store),
              builder: (BuildContext context, NotesViewModel vm) {
                return RawMaterialButton(onPressed: () {
                  vm.addNote(
                    title: jsonEncode(mockNotes.first.title),
                    body: jsonEncode(mockNotes.first.body),
                  );
                });
              },
            ),
          );
          await tester.pumpAndSettle();

          await tester.tap(find.byType(RawMaterialButton));
          await tester.pumpAndSettle();

          expect(storeTester.state.noteState?.allNotes, isNotEmpty);
        },
      );

      testWidgets(
        'should save note to state',
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
            child: const NoteEditorPage(),
          );
          await tester.pumpAndSettle();

          final Finder body = find.byKey(WidgetKeys.markdownBodyKey);
          final Finder saveBtn = find.byKey(WidgetKeys.saveButtonKey);

          await tester.ensureVisible(body);
          await tester.ensureVisible(saveBtn);

          await tester.pumpAndSettle();
          expect(body, findsOneWidget);
          expect(saveBtn, findsOneWidget);
          expect(
            storeTester.state.noteState?.activeNote,
            isNotNull,
          );

          await tester.tap(saveBtn);
          await tester.pumpAndSettle();

          expect(storeTester.state.noteState?.activeNote, isNotNull);
          expect(storeTester.state.noteState?.activeNote?.body, isNotNull);
        },
      );

      testWidgets(
        'should save note to state on back pressed',
        (WidgetTester tester) async {
          final StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial().copyWith.noteState!.call(
                  activeNote: mockNotes.first,
                ),
          );
          await tester.pumpAndSettle();

          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            child: const NoteEditorPage(),
          );
          await tester.pumpAndSettle();

          final Finder title = find.byKey(WidgetKeys.markdownTitleKey);
          final Finder body = find.byKey(WidgetKeys.markdownBodyKey);
          final Finder backBtn = find.byKey(WidgetKeys.backButtonKey);

          await tester.ensureVisible(title);
          await tester.ensureVisible(body);
          await tester.ensureVisible(backBtn);

          expect(title, findsOneWidget);
          expect(body, findsOneWidget);
          expect(backBtn, findsOneWidget);
          expect(storeTester.state.noteState?.allNotes?.isEmpty, true);

          await tester.tap(backBtn);
          await tester.pumpAndSettle();

          expect(storeTester.state.noteState?.allNotes?.isEmpty, true);
        },
      );

      testWidgets(
        'should update a note to state',
        (WidgetTester tester) async {
          final StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial().copyWith.noteState!.call(
                  allNotes: mockNotes,
                  activeNote: mockNotes.first,
                ),
          );

          await tester.pumpAndSettle();

          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            child: const NoteEditorPage(),
          );
          await tester.pumpAndSettle();

          final Finder title = find.byKey(WidgetKeys.markdownTitleKey);
          final Finder body = find.byKey(WidgetKeys.markdownBodyKey);
          final Finder saveBtn = find.byKey(WidgetKeys.saveButtonKey);

          await tester.ensureVisible(title);
          await tester.ensureVisible(body);
          await tester.ensureVisible(saveBtn);

          expect(title, findsOneWidget);
          expect(body, findsOneWidget);
          expect(saveBtn, findsOneWidget);
          expect(storeTester.state.noteState?.activeNote, isNotNull);

          await tester.tap(saveBtn);
          await tester.pumpAndSettle();

          expect(storeTester.state.noteState?.activeNote, isNotNull);
        },
      );

      testWidgets(
        'should update a note to state on back pressed',
        (WidgetTester tester) async {
          final StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial().copyWith.noteState!.call(
                  allNotes: mockNotes,
                  activeNote: mockNotes.first,
                ),
          );

          await tester.pumpAndSettle();

          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            child: const NoteEditorPage(),
          );
          await tester.pumpAndSettle();

          final Finder title = find.byKey(WidgetKeys.markdownTitleKey);
          final Finder body = find.byKey(WidgetKeys.markdownBodyKey);
          final Finder backBtn = find.byKey(WidgetKeys.backButtonKey);

          await tester.ensureVisible(title);
          await tester.ensureVisible(body);
          await tester.ensureVisible(backBtn);

          expect(title, findsOneWidget);
          expect(body, findsOneWidget);
          expect(backBtn, findsOneWidget);
          expect(
            storeTester.state.noteState?.allNotes?.length,
            mockNotes.length,
          );

          await tester.tap(backBtn);
          await tester.pumpAndSettle();

          expect(
            storeTester.state.noteState?.allNotes?.length,
            mockNotes.length,
          );
        },
      );
    },
  );
}
