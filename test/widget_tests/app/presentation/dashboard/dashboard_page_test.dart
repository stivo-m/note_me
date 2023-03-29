import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/states/note_state/note_state.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:note_it/app/presentation/pages/dashboard/note_editor/note_editor_page.dart';
import 'package:note_it/app/presentation/pages/settings/settings_page.dart';
import 'package:note_it/app/presentation/widgets/custom_app_bar.dart';
import 'package:note_it/app/presentation/widgets/empty_state.dart';
import 'package:note_it/app/presentation/widgets/note_preview.dart';

import '../../../../mocks/mocks.dart';
import '../../../../test_helpers/build_test_widget.dart';

void main() {
  group(
    'Dashboard Page',
    () {
      testWidgets(
        'should render properly',
        (WidgetTester tester) async {
          await buildTestWidget(
            tester: tester,
            child: const DashboardPage(),
          );

          await tester.pumpAndSettle();

          expect(find.byType(CustomAppBar), findsOneWidget);
          expect(find.byType(AppEmptyState), findsOneWidget);
          expect(find.byType(NotePreview), findsNothing);
        },
      );

      testWidgets(
        'should show a list of note previews',
        (WidgetTester tester) async {
          final StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial().copyWith(
              noteState: NoteState.initial().copyWith(allNotes: mockNotes),
            ),
          );
          await buildTestWidget(
            store: storeTester.store,
            tester: tester,
            child: const DashboardPage(),
          );

          await tester.pumpAndSettle();

          expect(find.byType(CustomAppBar), findsOneWidget);
          expect(find.byType(AppEmptyState), findsNothing);
          expect(find.byType(NotePreview), findsNWidgets(mockNotes.length));
        },
      );

      testWidgets(
        'should navigate to settings page',
        (WidgetTester tester) async {
          await buildTestWidget(
            tester: tester,
            child: const DashboardPage(),
          );

          await tester.pumpAndSettle();

          final Finder settingsBtn = find.byKey(
            WidgetKeys.settingsBtnKey,
          );
          await tester.ensureVisible(settingsBtn);
          expect(settingsBtn, findsOneWidget);

          await tester.tap(settingsBtn);
          await tester.pumpAndSettle();

          expect(find.byType(SettingsPage), findsOneWidget);
          expect(find.byType(DashboardPage), findsNothing);
        },
      );

      testWidgets(
        'should have a floating icon button',
        (WidgetTester tester) async {
          await buildTestWidget(
            tester: tester,
            child: const DashboardPage(),
          );

          await tester.pumpAndSettle();

          final Finder floatingBtn = find.byType(FloatingActionButton);
          await tester.ensureVisible(floatingBtn);
          expect(floatingBtn, findsOneWidget);

          await tester.tap(floatingBtn);
          await tester.pumpAndSettle();

          expect(find.byType(NoteEditorPage), findsOneWidget);
        },
      );
    },
  );
}
