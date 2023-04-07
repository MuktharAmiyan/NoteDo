import 'package:flutter/material.dart';
import '../widgets/note_grid_widget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: const [
          NoteGridWidget(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.edit),
      // ),
    );
  }
}
