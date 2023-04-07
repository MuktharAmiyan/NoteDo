import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';

import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';
import 'package:notedo/feature/note/domain/repository/note_repository.dart';

class GetAllNoteUsecase extends Usecase<Iterable, NoParams> {
  final NoteRepository noteRepository;

  GetAllNoteUsecase(this.noteRepository);
  @override
  Future<Either<Failure, Iterable<Note>>> call(NoParams params) {
    return noteRepository.getAllNotes();
  }
}
