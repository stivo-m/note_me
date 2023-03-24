import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/app/domain/constants/strings.dart';
import 'package:note_it/app/domain/core/entities/errors/system_error.dart';

void main() {
  group('System Error', () {
    test(
      'should receive an error and convert it to json',
      () {
        SystemError error = SystemError(
          errorType: ErrorType.formatError,
          message: AppStrings.noItemsToDisplay,
          stackTrace: StackTrace.fromString(AppStrings.noItemsToDisplay),
        );

        final Map<String, dynamic> errorMap = error.toJson();
        expect(errorMap, isA<Map<String, dynamic>>());
        expect(errorMap.containsKey('message'), true);
        expect(errorMap['message'], error.message);
      },
    );

    test(
      'should convert from json',
      () {
        SystemError error = SystemError(
          errorType: ErrorType.formatError,
          message: AppStrings.noItemsToDisplay,
          stackTrace: StackTrace.fromString(AppStrings.noItemsToDisplay),
        );

        final Map<String, dynamic> errorMap = error.toJson();
        expect(errorMap, isA<Map<String, dynamic>>());
        expect(errorMap.containsKey('message'), true);
        expect(errorMap['message'], error.message);

        SystemError fromJson = SystemError.fromJson(errorMap);
        expect(fromJson, isA<SystemError>());
        expect(errorMap['message'], fromJson.message);
      },
    );

    test(
      'should have an initial state',
      () {
        SystemError systemError = SystemError.initial();
        expect(systemError, isA<SystemError>());
      },
    );
  });
}
