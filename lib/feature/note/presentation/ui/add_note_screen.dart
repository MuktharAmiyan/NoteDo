import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/note/presentation/bloc/bloc/note_bloc.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late TextEditingController _titleTextEditingController;
  late TextEditingController _noteTextTextEditingController;
  @override
  void initState() {
    _titleTextEditingController = TextEditingController();
    _noteTextTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _noteTextTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                maxLines: null,
                controller: _titleTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                maxLines: null,
                controller: _noteTextTextEditingController,
                decoration: const InputDecoration(
                  hintText: 'Note',
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_noteTextTextEditingController.text.trim().isNotEmpty ||
              _titleTextEditingController.text.trim().isNotEmpty) {
            _addNote();
          }
          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }

  void _addNote() {
    log('Note Addddd');
    context.read<NoteBloc>().add(
          AddNoteEvenet(
            title: _titleTextEditingController.text.trim(),
            noteText: _noteTextTextEditingController.text.trim(),
          ),
        );
  }
}
