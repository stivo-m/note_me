// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteEntity _$$_NoteEntityFromJson(Map<String, dynamic> json) =>
    _$_NoteEntity(
      id: json['id'],
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_NoteEntityToJson(_$_NoteEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
