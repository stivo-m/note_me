import 'package:flutter/material.dart';
import 'package:note_it/app/domain/constants/spacers.dart';
import 'package:note_it/app/domain/core/entities/note/note_entity.dart';
import 'package:note_it/app/presentation/widgets/note_preview.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    required this.allNotes,
    super.key,
  });

  final List<NoteEntity> allNotes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SpaceUtils.large),
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 10,
        childAspectRatio: 0.78,
        children: allNotes.map((NoteEntity noteEntity) {
          return NotePreview(noteEntity: noteEntity);
        }).toList(),
      ),
    );
  }
}
