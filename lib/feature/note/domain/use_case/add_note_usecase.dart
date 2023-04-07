import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';

import '../repository/note_repository.dart';

class AddNoteUsecase extends Usecase<None, Note> {
  final NoteRepository noteRepository;

  AddNoteUsecase(this.noteRepository);

  @override
  Future<Either<Failure, None>> call(Note params) {
    return noteRepository.addNote(params);
  }
}
