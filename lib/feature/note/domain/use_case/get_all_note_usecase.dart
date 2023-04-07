import 'package:notedo/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/note/domain/repository/note_repository.dart';

class GetAllNoteUsecase extends Usecase<Iterable, NoParams> {
  final NoteRepository noteRepository;

  GetAllNoteUsecase(this.noteRepository);
  @override
  Future<Either<Failure, Iterable>> call(NoParams params) {
    return noteRepository.getAllNotes();
  }
}
