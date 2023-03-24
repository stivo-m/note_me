// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SystemError _$$_SystemErrorFromJson(Map<String, dynamic> json) =>
    _$_SystemError(
      message: json['message'] as String?,
      errorType: $enumDecodeNullable(_$ErrorTypeEnumMap, json['errorType']),
    );

Map<String, dynamic> _$$_SystemErrorToJson(_$_SystemError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errorType': _$ErrorTypeEnumMap[instance.errorType],
    };

const _$ErrorTypeEnumMap = {
  ErrorType.databaseError: 'databaseError',
  ErrorType.formatError: 'formatError',
  ErrorType.unknown: 'unknown',
};
