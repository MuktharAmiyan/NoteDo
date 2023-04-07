import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/note/data/model/note_model.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, Iterable<Note>>> getAllNotes();
  Future<Either<Failure, Unit>> addNote(NoteModel note);
  Future<Either<Failure, Unit>> editNote(NoteModel note);
  Future<Either<Failure, Unit>> deleteNote(Note note);
}
