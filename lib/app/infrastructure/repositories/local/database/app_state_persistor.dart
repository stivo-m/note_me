// Flutter imports:
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:async_redux/async_redux.dart';
import 'package:note_it/app/application/states/states/app_state.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/database_base.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/init_database.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/note_me_mobile_database.dart';
import 'package:sqflite/sqflite.dart';

/// [NoteMeStateDatabase] is the middleware that interacts with the database on behalf
/// of the application. From the apps perspective, it doesn't care which database
/// its saving its state on. NoteMeStateDatabase therefore offers different implementations
/// for its method.
class NoteMeStateDatabase implements PersistorPrinterDecorator<AppState> {
  NoteMeStateDatabase({
    required this.dataBaseName,
    Duration throttle = const Duration(seconds: 2),
    Duration saveDuration = const Duration(),
  })  : _throttle = throttle,
        _saveDuration = saveDuration;

  final String dataBaseName;

  final Duration _saveDuration;
  final Duration _throttle;

  @override
  Duration get throttle => _throttle;

  @override
  Future<void> deleteState() async {
    await NoteMeMobileDatabase<Database>(
            initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .clearDatabase();
  }

  @override
  Future<void> persistDifference({
    required AppState newState,
    AppState? lastPersistedState,
  }) async {
    await Future<dynamic>.delayed(saveDuration);

    if (lastPersistedState == null ||
        lastPersistedState.noteState != newState.noteState ||
        lastPersistedState.themeMode != newState.themeMode) {
      await persistState(
        newState,
        NoteMeMobileDatabase<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  /// we first check whether the database is empty
  ///
  /// - if the database is empty, we return null
  /// - else, we retrieve the state from the database
  @override
  Future<AppState> readState() async {
    if (await NoteMeMobileDatabase<Database>(
            initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .isDatabaseEmpty()) {
      return AppState.initial();
    } else {
      return retrieveState(NoteMeMobileDatabase<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName)));
    }
  }

  @override
  Future<void> saveInitialState(AppState state) async =>
      persistDifference(newState: state);

  Duration get saveDuration => _saveDuration;

  Future<void> init() async {
    await NoteMeMobileDatabase<Database>(
            initializeDB: InitializeDB<Database>(dbName: this.dataBaseName))
        .database;
  }

  /// saves app state to the database
  @visibleForTesting
  Future<void> persistState(
      AppState newState, NoteMeDatabase<dynamic> database) async {
    // persist all the app states
    await Future.wait(Tables.values.map((Tables table) {
      return Future<void>.value(
        database.saveState(
          data: jsonDecode(jsonEncode(newState.toMap()[table.name])),
          table: table,
        ),
      );
    }));
  }

  /// retrieves app state to the database
  @visibleForTesting
  Future<AppState> retrieveState(NoteMeDatabase<dynamic> database) async {
    final List<Map<String, dynamic>> retrieved = await Future.wait(
      Tables.values.map(
        (Tables table) {
          return Future<Map<String, dynamic>>.value(
            database.retrieveState(table).then(
                  (Map<String, dynamic> value) => <String, dynamic>{
                    table.name: value,
                  },
                ),
          );
        },
      ),
    );
    final Map<String, dynamic> map = Map<String, dynamic>();
    retrieved.forEach((Map<String, dynamic> element) {
      map.addAll(element);
    });
    return AppState.fromJson(map);
  }
}
