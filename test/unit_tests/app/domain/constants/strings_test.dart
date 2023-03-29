import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/app/domain/constants/strings.dart';

void main() {
  group('Strings Tests -', () {
    AppContext.values.forEach((AppContext appContext) {
      test(
        'should return proper db name for ${describeEnum(appContext)} context',
        () {
          final String suffix = describeEnum(appContext);
          final String version = AppStrings.appVersion;
          final String result =
              'com.note_me.app.store-02.${suffix}-${version}.db';

          expect(AppStrings.getDatabaseName(appContext), result);
        },
      );
    });
  });
}
