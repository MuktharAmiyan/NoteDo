import 'package:flutter/material.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';
import 'add_note_card.dart';
import 'note_card_widget.dart';

class NoteGridWidget extends StatelessWidget {
  const NoteGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300),
          itemCount: 11 + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return const AddNoteCard();
            } else {
              final note = index - 1;
              return NoteCardWidget(
                note: Note(
                  id: 100,
                  title: 'This is the first Title of NoteDo App',
                  noteText:
                      'This is the first note text for the app NoteDo ,NoteDo is a application made with flutter and uses loca storage sqflite, also made using bloc state management and uses clean architucture',
                  createdAt: DateTime.now(),
                ),
              );
            }
          }),
    );
  }
}
