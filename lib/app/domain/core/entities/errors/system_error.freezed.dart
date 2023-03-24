// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SystemError _$SystemErrorFromJson(Map<String, dynamic> json) {
  return _SystemError.fromJson(json);
}

/// @nodoc
mixin _$SystemError {
  String? get message => throw _privateConstructorUsedError;
  ErrorType? get errorType => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  StackTrace? get stackTrace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SystemErrorCopyWith<SystemError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemErrorCopyWith<$Res> {
  factory $SystemErrorCopyWith(
          SystemError value, $Res Function(SystemError) then) =
      _$SystemErrorCopyWithImpl<$Res, SystemError>;
  @useResult
  $Res call(
      {String? message,
      ErrorType? errorType,
      @JsonKey(ignore: true) StackTrace? stackTrace});
}

/// @nodoc
class _$SystemErrorCopyWithImpl<$Res, $Val extends SystemError>
    implements $SystemErrorCopyWith<$Res> {
  _$SystemErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorType = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as ErrorType?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SystemErrorCopyWith<$Res>
    implements $SystemErrorCopyWith<$Res> {
  factory _$$_SystemErrorCopyWith(
          _$_SystemError value, $Res Function(_$_SystemError) then) =
      __$$_SystemErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      ErrorType? errorType,
      @JsonKey(ignore: true) StackTrace? stackTrace});
}

/// @nodoc
class __$$_SystemErrorCopyWithImpl<$Res>
    extends _$SystemErrorCopyWithImpl<$Res, _$_SystemError>
    implements _$$_SystemErrorCopyWith<$Res> {
  __$$_SystemErrorCopyWithImpl(
      _$_SystemError _value, $Res Function(_$_SystemError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? errorType = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$_SystemError(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorType: freezed == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as ErrorType?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SystemError implements _SystemError {
  _$_SystemError(
      {this.message, this.errorType, @JsonKey(ignore: true) this.stackTrace});

  factory _$_SystemError.fromJson(Map<String, dynamic> json) =>
      _$$_SystemErrorFromJson(json);

  @override
  final String? message;
  @override
  final ErrorType? errorType;
  @override
  @JsonKey(ignore: true)
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'SystemError(message: $message, errorType: $errorType, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, errorType, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemErrorCopyWith<_$_SystemError> get copyWith =>
      __$$_SystemErrorCopyWithImpl<_$_SystemError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SystemErrorToJson(
      this,
    );
  }
}

abstract class _SystemError implements SystemError {
  factory _SystemError(
      {final String? message,
      final ErrorType? errorType,
      @JsonKey(ignore: true) final StackTrace? stackTrace}) = _$_SystemError;

  factory _SystemError.fromJson(Map<String, dynamic> json) =
      _$_SystemError.fromJson;

  @override
  String? get message;
  @override
  ErrorType? get errorType;
  @override
  @JsonKey(ignore: true)
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$_SystemErrorCopyWith<_$_SystemError> get copyWith =>
      throw _privateConstructorUsedError;
}
