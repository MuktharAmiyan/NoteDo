import 'package:fpdart/fpdart.dart';
import 'package:notedo/feature/note/data/data_source/note_local_data_source.dart';
import 'package:notedo/feature/note/data/model/note_model.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/note/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;
  NoteRepositoryImpl(this.noteLocalDataSource);

  @override
  Future<Either<Failure, Unit>> addNote(NoteModel note) async {
    try {
      await noteLocalDataSource.addNote(note);
      return right(unit);
    } catch (e) {
      return left(
        LocalDataSourceFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteNote(NoteModel note) async {
    try {
      await noteLocalDataSource.deleteNote(note);
      return right(unit);
    } catch (e) {
      return left(
        LocalDataSourceFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> editNote(NoteModel note) async {
    try {
      await noteLocalDataSource.editNote(note);
      return right(unit);
    } catch (e) {
      return left(
        LocalDataSourceFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Iterable<Note>>> getAllNotes() async {
    try {
      final res = await noteLocalDataSource.getAllNotes();
      return right(res);
    } catch (e) {
      return left(
        LocalDataSourceFailure(),
      );
    }
  }
}
