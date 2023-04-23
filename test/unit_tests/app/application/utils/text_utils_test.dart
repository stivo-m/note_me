import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/application/utils/text_utils.dart';

void main() {
  group('TextUtils:', () {
    group('FormatTimeAgo', () {
      test('should convert a date string to time-ago string', () {
        final String fifteenMinAgo = DateTime.now()
            .subtract(const Duration(minutes: 15))
            .toIso8601String();

        expect(TextUtils.formatTimeAgo(fifteenMinAgo), '15 minutes ago');
      });

      test('should convert a date object to time-ago string', () {
        final DateTime fifteenMinAgo =
            DateTime.now().subtract(const Duration(minutes: 15));

        expect(TextUtils.formatTimeAgo(fifteenMinAgo), '15 minutes ago');
      });

      test('should default null as current datetime', () {
        expect(TextUtils.formatTimeAgo(null), 'a moment ago');
      });
    });
  });
}
