import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/todo/data/model/to_do_model.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/domain/repository/to_do_repository.dart';

class AddToDoUsecase extends Usecase<Unit, ToDo> {
  final ToDoRepository toDoReository;

  AddToDoUsecase(this.toDoReository);
  @override
  Future<Either<Failure, Unit>> call(ToDo params) {
    return toDoReository.addToDo(
      ToDoModel.fromEntity(params),
    );
  }
}
