import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/application/states/states/note_state/note_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class DeleteNoteAction extends ReduxAction<AppState> {
  DeleteNoteAction({
    required this.id,
  });

  final String id;

  @override
  AppState? reduce() {
    final NoteState? noteState = state.noteState;
    final List<NoteEntity> updatedNotes = <NoteEntity>[
      ...noteState!.allNotes!
          .where((NoteEntity noteEntity) => noteEntity.id != id)
          .toList()
    ];

    return state.copyWith.noteState?.call(
      allNotes: updatedNotes,
    );
  }
}
