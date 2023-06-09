import 'package:note_it/app/application/states/states/note_state/note_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class UpdateNoteAction extends ReduxAction<AppState> {
  final String id;
  final String? title;
  final String? body;

  UpdateNoteAction({
    required this.id,
    this.title,
    this.body,
  });
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
    final NoteEntity updated = noteEntity!.copyWith(
      updatedAt: DateTime.now().toIso8601String(),
      title: title ?? noteEntity.title,
      body: body ?? noteEntity.body,
    );

    final List<NoteEntity> updatedNotes = <NoteEntity>[
      updated,
      ...noteState.allNotes!
          .where((NoteEntity noteEntity) => noteEntity.id != id)
          .toList()
    ];

    return state.copyWith.noteState?.call(
      allNotes: updatedNotes,
      activeNote: updated,
    );
  }
}
