import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/infrastructure/repositories/local/database/migrations/init_migrations.dart';

void main() {
  group('Migrations', () {
    test('should have 2 migrations', () {
      expect(migrations.length, 2);
    });
  });
}
