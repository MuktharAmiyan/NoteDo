part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NotesLoadedState extends NoteState {
  final Iterable<Note> notes;
  const NotesLoadedState(this.notes);
  @override
  List<Object> get props => [notes];
}

class NotesLoadingState extends NoteState {
  @override
  List<Object> get props => [];
}

class NoteErrosState extends NoteState {
  final String errorMessage;
  const NoteErrosState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class NoteFetchErrorState extends NoteErrosState {
  const NoteFetchErrorState() : super('Error while fetching Note');
}

class NoteAddErrorState extends NoteErrosState {
  const NoteAddErrorState() : super('Error while adding Note');
}

class NoteEditErrorState extends NoteErrosState {
  const NoteEditErrorState() : super('Error while editing Note');
}

class NoteDeleteErrorState extends NoteErrosState {
  const NoteDeleteErrorState() : super('Error while deleting Note');
}
