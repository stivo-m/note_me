import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/bin/bootstrap/note_it_app.dart';
import 'package:note_it/bin/bootstrap/state_persistor/setup_state_persistor.dart';

/// [bootstrap] is a function that will determine the entry point into the
/// application. From this entry-point, we can handle any initializations and
/// pre-launch checks necessary for the application to work properly.
Future<void> bootstrap({
  AppContext appContext = AppContext.development,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  /// We can obtain the Store once it has been setup properly. This means the
  /// store will be configured with persistence and debug printing when
  /// necessary.
  final Store<AppState> store = await setupStatePersistence(
    appContext: appContext,
  );

  runApp(
    NoteItApp(
      appContext: appContext,
      store: store,
    ),
  );
}
