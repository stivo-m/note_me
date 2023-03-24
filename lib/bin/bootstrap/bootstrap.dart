import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/enums.dart';
import 'package:note_it/bin/bootstrap/note_it_app.dart';

/// [bootstrap] is a function that will determine the entry point into the
/// application. From this entry-point, we can handle any initializations and
/// pre-launch checks necessary for the application to work properly.
Future<void> bootstrap({
  AppContext appContext = AppContext.development,
}) async {
  runApp(NoteItApp(appContext: appContext));
}
