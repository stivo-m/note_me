import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/app/presentation/widgets/app_input_field.dart';

import '../../../../test_helpers/build_test_widget.dart';

void main() {
  group(
    'AppInputField',
    () {
      testWidgets(
        'should show title whenever it is passed',
        (WidgetTester tester) async {
          await buildTestWidget(
            tester: tester,
            child: const AppInputField(
              title: AppStrings.appTitle,
            ),
          );

          await tester.pumpAndSettle();

          expect(find.text(AppStrings.appTitle), findsOneWidget);
        },
      );
    },
  );
}
