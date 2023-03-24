import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/constants/keys.dart';
import 'package:note_it/app/presentation/pages/settings/settings_page.dart';

import '../../../../test_helpers/build_test_widget.dart';

void main() {
  group(
    'Settings Page',
    () {
      testWidgets(
        'should update applications theme',
        (WidgetTester tester) async {
          final StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial(),
          );
          await buildTestWidget(
            store: storeTester.store,
            tester: tester,
            child: const SettingsPage(),
          );

          await tester.pumpAndSettle();

          final Finder themeBtn = find.byKey(WidgetKeys.settingsBtnKey);
          await tester.ensureVisible(themeBtn);
          expect(themeBtn, findsOneWidget);
          expect(storeTester.state.themeMode, ThemeMode.dark);

          await tester.tap(themeBtn);
          await tester.pump(const Duration(seconds: 1));
          await tester.pumpAndSettle();

          expect(storeTester.state.themeMode, ThemeMode.light);
          expect(themeBtn, findsOneWidget);
        },
      );
    },
  );
}
