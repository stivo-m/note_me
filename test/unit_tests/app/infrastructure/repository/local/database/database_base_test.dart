// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/database_base.dart';


void main() {
  test('TablesEx should return correct name', () {
    expect(Tables.noteState.name, 'noteState');
    expect(Tables.themeMode.name, 'themeMode');
  });
}
