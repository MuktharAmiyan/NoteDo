import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/note/data/model/note_model.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';

import '../repository/note_repository.dart';

class EditNoteUsecase extends Usecase<Unit, Note> {
  final NoteRepository noteRepository;

  EditNoteUsecase(this.noteRepository);

  @override
  Future<Either<Failure, Unit>> call(Note params) {
    return noteRepository.editNote(NoteModel.fromEntity(params));
  }
}
