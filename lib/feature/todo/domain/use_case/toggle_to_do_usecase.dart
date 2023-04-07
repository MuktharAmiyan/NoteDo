import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/todo/data/model/to_do_model.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/domain/repository/to_do_repository.dart';

class ToggleToDoUsecase extends Usecase<Unit, ToDo> {
  final ToDoRepository toDoReository;

  ToggleToDoUsecase(this.toDoReository);
  @override
  Future<Either<Failure, Unit>> call(ToDo params) {
    return toDoReository.toggleToDo(ToDoModel.fromEntity(params));
  }
}
