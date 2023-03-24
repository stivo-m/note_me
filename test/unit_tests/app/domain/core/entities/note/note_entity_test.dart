import 'package:flutter_test/flutter_test.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  group('NoteEntity', () {
    test(
      'should convert to json',
      () {
        NoteEntity noteEntity = mockNotes.first;
        final Map<String, dynamic> noteMap = noteEntity.toJson();

        expect(noteMap, isA<Map<String, dynamic>>());
        expect(noteMap.containsKey('title'), true);
        expect(noteMap.containsKey('body'), true);
        expect(noteMap['title'], noteEntity.title);
        expect(noteMap['body'], noteEntity.body);
      },
    );

    test(
      'should convert from json',
      () {
        NoteEntity noteEntity = mockNotes.first;
        final Map<String, dynamic> noteMap = noteEntity.toJson();

        expect(noteMap, isA<Map<String, dynamic>>());

        NoteEntity note = NoteEntity.fromJson(noteMap);
        expect(note, isA<NoteEntity>());
        expect(noteMap['title'], note.title);
      },
    );

    test(
      'should have an initial state',
      () {
        NoteEntity noteEntity = NoteEntity.initial();
        expect(noteEntity, isA<NoteEntity>());
      },
    );
  });
}
