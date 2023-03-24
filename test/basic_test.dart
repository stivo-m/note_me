// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/app/presentation/widgets/custom_app_bar.dart';
import 'package:note_it/bin/bootstrap/note_it_app.dart';

void main() {
  testWidgets('Base test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const NoteItApp(appContext: AppContext.development),
    );

    expect(find.byType(CustomAppBar), findsOneWidget);
  });
}
