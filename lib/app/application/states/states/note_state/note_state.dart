// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

part 'note_state.freezed.dart';
part 'note_state.g.dart';

@freezed
class NoteState with _$NoteState {
  factory NoteState({
    NoteEntity? activeNote,
    List<NoteEntity>? allNotes,
  }) = _NoteState;

  factory NoteState.fromJson(Map<String, dynamic> json) =>
      _$NoteStateFromJson(json);

  factory NoteState.initial() => NoteState(
        activeNote: null,
        allNotes: <NoteEntity>[],
      );
}
