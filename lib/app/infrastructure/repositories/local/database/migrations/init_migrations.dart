import 'package:note_it/app/infrastructure/repositories/local/database/database_base.dart';

/// add migrations here for example;
/// '''alter table _task add column done integer default 0;'''
final List<String> migrations = Tables.values.map((Tables table) {
  return '''
            CREATE TABLE IF NOT EXISTS ${table.name}(id INTEGER PRIMARY KEY, ${table.name} TEXT)
          ''';
}).toList();
