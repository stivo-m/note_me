import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_it/app/domain/constants/enums.dart';

part 'system_error.freezed.dart';
part 'system_error.g.dart';

@freezed
class SystemError with _$SystemError {
  factory SystemError({
    String? message,
    ErrorType? errorType,
    @JsonKey(ignore: true) StackTrace? stackTrace,
  }) = _SystemError;

  factory SystemError.fromJson(Map<String, dynamic> json) =>
      _$SystemErrorFromJson(json);

  factory SystemError.initial() => SystemError(
        message: null,
        errorType: ErrorType.unknown,
        stackTrace: StackTrace.empty,
      );
}
