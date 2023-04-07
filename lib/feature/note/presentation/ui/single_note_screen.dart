import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/core/dialog/delete_dialog.dart';
import 'package:notedo/core/dialog/dialog_model.dart';
import 'package:notedo/core/extension/date_formate.dart';
import 'package:notedo/core/service_locator.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';
import 'package:notedo/feature/note/presentation/bloc/bloc/note_bloc.dart';
import 'package:notedo/feature/note/presentation/bloc/note_or_edit/note_or_edit_cubit.dart';

class SignleNoteScreen extends StatefulWidget {
  final Note note;
  const SignleNoteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<SignleNoteScreen> createState() => _SignleNoteScreenState();
}

class _SignleNoteScreenState extends State<SignleNoteScreen> {
  late TextEditingController _titleTextEditingController;
  late TextEditingController _noteTextTextEditingController;
  @override
  void initState() {
    _titleTextEditingController =
        TextEditingController(text: widget.note.title);
    _noteTextTextEditingController =
        TextEditingController(text: widget.note.noteText);

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
    return BlocProvider(
      create: (context) => getIt<NoteOrEditCubit>(),
      child: BlocBuilder<NoteOrEditCubit, NoteOrEditState>(
        builder: (context, state) {
          final isEdit = state.isEdit;
          return Scaffold(
            appBar: AppBar(
              actions: isEdit
                  ? null
                  : [
                      IconButton(
                        onPressed: () async {
                          final res = await DeleteDialog('Note').show(context);
                          if (res == true) {
                            _deleteNote().then((_) {
                              Navigator.pop(context);
                            });
                          }
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
            ),
            body: Hero(
              tag: widget.note.id ?? 'note',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          widget.note.createdAt.format,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        readOnly: !isEdit,
                        maxLines: null,
                        controller: _titleTextEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        readOnly: !isEdit,
                        maxLines: null,
                        controller: _noteTextTextEditingController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (!isEdit) {
                  context.read<NoteOrEditCubit>().changeState();
                  return;
                } else {
                  _saveEditedNote();
                  context.read<NoteOrEditCubit>().changeState();
                }
              },
              child: Icon(isEdit ? Icons.done : Icons.edit),
            ),
          );
        },
      ),
    );
  }

  void _saveEditedNote() {
    context.read<NoteBloc>().add(
          EditNoteEvenet(
            note: widget.note,
            title: _titleTextEditingController.text.trim(),
            noteText: _noteTextTextEditingController.text.trim(),
          ),
        );
  }

  Future<void> _deleteNote() async {
    context.read<NoteBloc>().add(
          DeleteNoteEvenet(note: widget.note),
        );
  }
}
