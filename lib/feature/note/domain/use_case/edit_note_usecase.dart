import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/note/data/model/note_model.dart';

import '../repository/note_repository.dart';

class EditNoteUsecase extends Usecase<Unit, NoteModel> {
  final NoteRepository noteRepository;

  EditNoteUsecase(this.noteRepository);

  @override
  Future<Either<Failure, Unit>> call(NoteModel params) {
    return noteRepository.editNote(params);
  }
}
