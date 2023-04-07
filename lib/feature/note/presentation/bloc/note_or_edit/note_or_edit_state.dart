part of 'note_or_edit_cubit.dart';

abstract class NoteOrEditState extends Equatable {
  final bool isEdit;
  const NoteOrEditState(
    this.isEdit,
  );

  @override
  List<Object> get props => [
        isEdit,
      ];
}

class NoteViewState extends NoteOrEditState {
  const NoteViewState() : super(false);
}

class EditNoteState extends NoteOrEditState {
  const EditNoteState() : super(true);
}
