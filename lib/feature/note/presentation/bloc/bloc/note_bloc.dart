import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';
import 'package:notedo/feature/note/domain/use_case/add_note_usecase.dart';
import 'package:notedo/feature/note/domain/use_case/delete_note_usecase.dart';
import 'package:notedo/feature/note/domain/use_case/edit_note_usecase.dart';
import 'package:notedo/feature/note/domain/use_case/get_all_note_usecase.dart';
part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetAllNoteUsecase getAllNoteUsecase;
  final AddNoteUsecase addNoteUsecase;
  final DeleteNoteUsecase deleteNoteUsecase;

  final EditNoteUsecase editNoteUsecase;
  NoteBloc({
    required this.getAllNoteUsecase,
    required this.addNoteUsecase,
    required this.deleteNoteUsecase,
    required this.editNoteUsecase,
  }) : super(NoteInitial()) {
    on<GetAllNoteEvenet>((event, emit) async {
      emit(NotesLoadingState());
      final res = await getAllNoteUsecase.call(NoParams());
      emit(
        res.fold(
          (l) => const NoteFetchErrorState(),
          (r) => NotesLoadedState(r),
        ),
      );
    });
    on<AddNoteEvenet>((event, emit) async {
      final note = Note(
          title: event.title,
          noteText: event.noteText,
          createdAt: DateTime.now());
      final res = await addNoteUsecase.call(note);
      final notes = await getAllNoteUsecase.call(NoParams());
      emit(
        res.fold(
          (l) => const NoteAddErrorState(),
          (r) => notes.fold(
            (l) => const NoteFetchErrorState(),
            (r) => NotesLoadedState(r),
          ),
        ),
      );
    });
    on<DeleteNoteEvenet>((event, emit) async {
      final res = await deleteNoteUsecase.call(event.note);
      final notes = await getAllNoteUsecase.call(NoParams());
      emit(
        res.fold(
          (l) => const NoteAddErrorState(),
          (r) => notes.fold(
            (l) => const NoteFetchErrorState(),
            (r) => NotesLoadedState(r),
          ),
        ),
      );
    });

    on<EditNoteEvenet>((event, emit) async {
      final note = Note(
        id: event.note.id,
        title: event.title,
        noteText: event.noteText,
        createdAt: DateTime.now(),
      );
      final res = await editNoteUsecase.call(note);
      final notes = await getAllNoteUsecase.call(NoParams());
      emit(
        res.fold(
          (l) => const NoteAddErrorState(),
          (r) => notes.fold(
            (l) => const NoteFetchErrorState(),
            (r) => NotesLoadedState(r),
          ),
        ),
      );
    });
  }
}
