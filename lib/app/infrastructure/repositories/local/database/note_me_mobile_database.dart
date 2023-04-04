// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:note_it/app/infrastructure/repositories/local/database/database_base.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/init_database.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/sqlite_init.dart';
import 'package:sqflite/sqflite.dart';

/// [NoteMeMobileDatabase] is the main entry for interacting with the database for mobile
/// It uses sqlite which a common RDMS. Unlike other key:value storage, sqlite offers
/// high flexibility when storing structured data.
/// The idea is to store, sessions, permissions(highly structured) and anything else
/// that required persistence.
/// When a new state has been added, it needs to be serialized so that it may be saved in the database
/// The command to serialize is [flutter pub run build_runner build --delete-conflicting-outputs]
class NoteMeMobileDatabase<T extends DatabaseExecutor>
    implements NoteMeDatabase<T> {
  NoteMeMobileDatabase({this.initializeDB});

  final InitializeDB<T>? initializeDB;

  /// [database] creates and returns an instance of the database as a future
  @override
  Future<T> get database async {
    return initializeDB!.database();
  }

  @override
  Future<void> clearDatabase() =>
      clearDatabaseHelper(this.initializeDB!.dbName);

  @override
  Future<int> countTableRecords(String table) async {
    final T _db = await this.database;
    final int? count = Sqflite.firstIntValue(
        await _db.rawQuery('SELECT COUNT(*) FROM $table'));
    return Future<int>.value(count);
  }

  @override
  Future<bool> isDatabaseEmpty() async {
    final List<int> totalCounts = await Future.wait(
      Tables.values.map(
        (Tables table) {
          return Future<int>.value(countTableRecords(table.name));
        },
      ),
    );

    final int counts = totalCounts.fold<int>(
      0,
      (int previousValue, int current) => previousValue + current,
    );

    if (counts > 0) {
      return false;
    }
    return true;
  }

  Future<Map<String, dynamic>> retrieveWorker(Tables table) async {
    final T _db = await this.database;
    final List<Map<dynamic, dynamic>> states = await _db
        .rawQuery('SELECT * FROM ${table.name} ORDER BY id DESC LIMIT 1');
    final Map<String, dynamic> _state = Map<String, dynamic>.from(states.first);

    return _state;
  }

  /// [retrieveState] get the current states.
  @override
  Future<Map<String, dynamic>> retrieveState(Tables table) async {
    final Map<String, dynamic> _state = await retrieveWorker(table);
    final dynamic state = json.decode(_state[table.name] as String);
    return state as Map<String, dynamic>;
  }

  /// [saveState] saves the current states by an [INSERT] in the database
  /// IMPORTANT: THIS METHOD WORKS ON THE ASSUMPTION THAT THE TABLE NAME MATCHES THE INSERTION FIELD NAME
  @override
  Future<void> saveState(
      {required Map<String, dynamic> data, required Tables table}) async {
    final T _db = await this.database;
    final String dataAsString = jsonEncode(data);
    final String tableName = table.name;
    await _db.rawInsert('INSERT INTO $tableName($tableName) VALUES(?)',
        <dynamic>[dataAsString]);
    return;
  }
}
