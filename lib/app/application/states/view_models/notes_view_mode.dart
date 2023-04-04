import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:note_it/app/application/states/actions/notes/add_note_action.dart';
import 'package:note_it/app/application/states/actions/notes/reset_active_note_action.dart';

import 'package:note_it/app/application/states/actions/notes/update_note_action.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class NotesViewModel {
  NotesViewModel({
    required this.activeNote,
    required this.allNotes,
    required this.addNote,
    required this.updateNote,
    required this.resetActiveNote,
  });

  final NoteEntity? activeNote;
  final List<NoteEntity> allNotes;

  // Actions
  final Function({
    required String title,
    required String body,
  }) addNote;

  final Function({
    required String id,
    String? title,
    String? body,
  }) updateNote;

  final VoidCallback resetActiveNote;

  static NotesViewModel fromStore(Store<AppState> store) {
    return NotesViewModel(
      allNotes: store.state.noteState?.allNotes ?? <NoteEntity>[],
      activeNote: store.state.noteState?.activeNote,
      addNote: ({required String body, required String title}) {
        store.dispatch(AddNoteAction(title: title, body: body));
      },
      updateNote: ({required String id, String? title, String? body}) {
        store.dispatch(UpdateNoteAction(id: id, title: title, body: body));
      },
      resetActiveNote: () => store.dispatch(ResetActiveNoteAction()),
    );
  }
}
