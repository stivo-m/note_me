import 'package:note_it/app/application/states/states/note_state/note_state.dart';
import 'package:uuid/uuid.dart';
import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class AddNoteAction extends ReduxAction<AppState> {
  final String title;
  final String body;

  AddNoteAction({
    required this.title,
    required this.body,
  });
  @override
  AppState? reduce() {
    final NoteEntity noteEntity = NoteEntity(
      id: const Uuid().v4(),
      title: title,
      body: body,
      createdAt: DateTime.now().toIso8601String(),
    );

    final NoteState? noteState = state.noteState;

    return state.copyWith.noteState?.call(
      activeNote: noteEntity,
      allNotes: <NoteEntity>[
        ...noteState?.allNotes ?? <NoteEntity>[],
        noteEntity,
      ],
    );
  }
}
