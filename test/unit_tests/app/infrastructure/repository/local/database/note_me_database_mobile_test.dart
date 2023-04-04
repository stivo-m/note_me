import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/init_database.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/note_me_mobile_database.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  MockStateDB mockDb = MockStateDB();
  MockInitializeDB initDb = MockInitializeDB();
  when(initDb.database()).thenAnswer(
      (Invocation realInvocation) => Future<MockStateDB>.value(mockDb));

  NoteMeMobileDatabase<MockStateDB> db =
      NoteMeMobileDatabase<MockStateDB>(initializeDB: initDb);

  Future<List<Map<String, Object?>>> returnVal(int count) =>
      Future<List<Map<String, Object?>>>.value(<Map<String, Object?>>[
        <String, Object?>{'users': count}
      ]);

  test('should call initialize and clear database : mock', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(
        () => InitializeDB<MockStateDB>(dbName: 'test_db')
            .database(preInitializedDB: mockDb),
        returnsNormally);

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    NoteMeMobileDatabase<MockStateDB> _db =
        NoteMeMobileDatabase<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('should throw exception on real state db. Missing plugin', () {
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'), returnsNormally);
    expect(() => InitializeDB<MockStateDB>(dbName: 'test_db').database(),
        throwsException);

    final InitializeDB<MockStateDB> initDB =
        InitializeDB<MockStateDB>(dbName: 'test_db');

    NoteMeMobileDatabase<MockStateDB> _db =
        NoteMeMobileDatabase<MockStateDB>(initializeDB: initDB);

    expect(_db.clearDatabase(), throwsException);
  });

  test('countTableRecords should return 0 entries', () async {
    when(mockDb.rawQuery('SELECT COUNT(*) FROM users'))
        .thenAnswer((Invocation realInvocation) async => returnVal(10));
    expect(await db.countTableRecords('users'), 10);
  });

  group(
    'NoteMeDatabaseMobile',
    () {
      test('should call initialize and clear database : mock', () {
        expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'),
            returnsNormally);
        expect(
            () => InitializeDB<MockStateDB>(dbName: 'test_db')
                .database(preInitializedDB: mockDb),
            returnsNormally);

        final InitializeDB<MockStateDB> initDB =
            InitializeDB<MockStateDB>(dbName: 'test_db');

        NoteMeMobileDatabase<MockStateDB> _db =
            NoteMeMobileDatabase<MockStateDB>(initializeDB: initDB);

        expect(_db.clearDatabase(), throwsException);
      });

      test('should throw exception on real state db. Missing plugin', () {
        expect(() => InitializeDB<MockStateDB>(dbName: 'test_db'),
            returnsNormally);
        expect(() => InitializeDB<MockStateDB>(dbName: 'test_db').database(),
            throwsException);

        final InitializeDB<MockStateDB> initDB =
            InitializeDB<MockStateDB>(dbName: 'test_db');

        NoteMeMobileDatabase<MockStateDB> _db =
            NoteMeMobileDatabase<MockStateDB>(initializeDB: initDB);

        expect(_db.clearDatabase(), throwsException);
      });

      test('countTableRecords should return 0 entries', () async {
        when(mockDb.rawQuery('SELECT COUNT(*) FROM users'))
            .thenAnswer((Invocation realInvocation) async => returnVal(10));
        expect(await db.countTableRecords('users'), 10);
      });
    },
  );
}
