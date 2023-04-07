import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notedo/core/extension/date_formate.dart';
import 'package:notedo/core/route/route_const_names.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;
  const NoteCardWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.signleNote, extra: note);
      },
      child: Card(
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
              Divider(
                color: Theme.of(context).colorScheme.background,
              ),
              Flexible(
                child: Text(
                  note.noteText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  note.createdAt.format,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
