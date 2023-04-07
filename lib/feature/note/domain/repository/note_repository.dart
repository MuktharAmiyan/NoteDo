import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, Iterable<Note>>> getAllNotes();
  Future<Either<Failure, None>> addNote(Note note);
  Future<Either<Failure, None>> editNote(Note note);
  Future<Either<Failure, None>> deleteNote(Note note);
}
