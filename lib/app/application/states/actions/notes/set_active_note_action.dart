import 'package:note_it/app/application/states/states/note_state/note_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class SetActiveNoteAction extends ReduxAction<AppState> {
  final String id;

  SetActiveNoteAction({required this.id});

  @override
  AppState? reduce() {
    final NoteState? noteState = state.noteState;
    final List<NoteEntity> matched = noteState!.allNotes!
        .where((NoteEntity noteEntity) => noteEntity.id == id)
        .toList();

    if (matched.isEmpty) {
      return state;
    }

    final NoteEntity? noteEntity = matched.first;

    return state.copyWith.noteState?.call(
      activeNote: noteEntity,
    );
  }
}
