part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetAllNoteEvenet extends NoteEvent {}

class AddNoteEvenet extends NoteEvent {
  final String title;
  final String noteText;

  const AddNoteEvenet({
    required this.title,
    required this.noteText,
  });
}

class EditNoteEvenet extends NoteEvent {
  final Note note;
  final String title;
  final String noteText;
  const EditNoteEvenet({
    required this.note,
    required this.title,
    required this.noteText,
  });
}

class DeleteNoteEvenet extends NoteEvent {
  final Note note;
  const DeleteNoteEvenet({
    required this.note,
  });
}
