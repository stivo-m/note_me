import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/init_database.dart';
import 'package:sqflite/sqflite.dart';

class MockBuildContext extends Mock implements BuildContext {}

List<NoteEntity> mockNotes = <NoteEntity>[
  NoteEntity(
    id: '1',
    title: r'''[{"insert":"Johanesbourg & its beauty!\n"}]''',
    body:
        r'''[{"insert":"There are a few things I noticed from Johanesbourg in South Africa:\n\nThere are alot of people"},{"insert":"\n","attributes":{"list":"ordered"}},{"insert":"There are alot of things to see"},{"insert":"\n","attributes":{"list":"ordered"}},{"insert":"You can never understand the quality of products sold in this region"},{"insert":"\n","attributes":{"list":"ordered"}},{"insert":"\n"},{"insert":"How I got here..","attributes":{"bold":true}},{"insert":"\nThis started a while ago. But since I was never born here, I decided to just be acquainted to the city through my normal monthly visits. \n\n"},{"insert":"Challenges","attributes":{"bold":true}},{"insert":"\nI have faced a number of challenges, including: \nLanguage barrier"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"Cultural shock"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"Perfection"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"\n"}]''',
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  )
];

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;

  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(Invocation.getter(#database),
              returnValue: Future<MockStateDB>.value(MockStateDB()))
          as Future<MockStateDB>;
}

class MockStateDB extends Mock implements Database {
  @override
  Future<List<Map<String, Object?>>> rawQuery(String sql,
          [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'users': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(
          10,
        ),
      ) as Future<int>;

  @override
  Batch batch() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeMethod<T>(String method, [dynamic arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeSqlMethod<T>(String method, String sql,
      [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(String table, Map<String, Object?> values,
      {String? nullColumnHack, ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(Future<T> Function(Transaction txn) action,
      {bool? exclusive}) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(String table, Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm}) {
    throw UnimplementedError();
  }
}
