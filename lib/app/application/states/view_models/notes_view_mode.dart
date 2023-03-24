import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class NotesViewModel {
  NotesViewModel({
    required this.activeNote,
    required this.allNotes,
  });

  final NoteEntity? activeNote;
  final List<NoteEntity> allNotes;

  static NotesViewModel fromStore(Store<AppState> store) {
    return NotesViewModel(
      allNotes: store.state.noteState?.allNotes ?? <NoteEntity>[],
      activeNote: store.state.noteState?.activeNote,
    );
  }
}
