import 'package:flutter/material.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;
  const NoteCardWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            Flexible(
              child: Text(
                note.noteText,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
