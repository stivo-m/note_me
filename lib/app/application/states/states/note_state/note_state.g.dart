// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteState _$$_NoteStateFromJson(Map<String, dynamic> json) => _$_NoteState(
      activeNote: json['activeNote'] == null
          ? null
          : NoteEntity.fromJson(json['activeNote'] as Map<String, dynamic>),
      allNotes: (json['allNotes'] as List<dynamic>?)
          ?.map((e) => NoteEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NoteStateToJson(_$_NoteState instance) =>
    <String, dynamic>{
      'activeNote': instance.activeNote,
      'allNotes': instance.allNotes,
    };
