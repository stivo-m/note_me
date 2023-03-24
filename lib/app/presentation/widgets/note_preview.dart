import 'package:flutter/material.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';

class NotePreview extends StatelessWidget {
  const NotePreview({
    required this.noteEntity,
    super.key,
  });

  final NoteEntity noteEntity;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
