import 'package:flutter/material.dart';
import '../widgets/note_grid_widget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        NoteGridWidget(),
      ],
    );
  }
}
