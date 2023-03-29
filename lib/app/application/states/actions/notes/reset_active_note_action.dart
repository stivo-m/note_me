
import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';

class ResetActiveNoteAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    return state.copyWith.noteState?.call(
      activeNote: null,
    );
  }
}
