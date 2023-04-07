import 'package:flutter/material.dart';

import 'package:notedo/feature/note/domain/entities/note.dart';

import 'add_note_card.dart';
import 'note_card_widget.dart';

class NoteGridWidget extends StatelessWidget {
  final Iterable<Note> notes;
  const NoteGridWidget({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300),
        itemCount: notes.length + 1,
        itemBuilder: (_, index) {
          if (index == 0) {
            return const AddNoteCard();
          } else {
            final note = notes.elementAt(index - 1);
            return NoteCardWidget(
              note: note,
            );
          }
        });
  }
}
