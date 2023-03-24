import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class MockBuildContext extends Mock implements BuildContext {}

List<NoteEntity> mockNotes = <NoteEntity>[
  NoteEntity(
    id: '1',
    title: 'Sample first note',
    body:
        'This is an example note. By default, it will have html tags and should be shown as markdown',
    createdAt: DateTime.now().toIso8601String(),
    updatedAt: DateTime.now().toIso8601String(),
  )
];
