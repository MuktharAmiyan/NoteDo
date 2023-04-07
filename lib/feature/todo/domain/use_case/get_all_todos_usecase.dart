import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/core/usecases/usecase.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/domain/repository/to_do_repository.dart';

class GetAllToDosUsecase extends Usecase<Iterable<ToDo>, ToDoType> {
  final ToDoRepository toDoReository;

  GetAllToDosUsecase(this.toDoReository);
  @override
  Future<Either<Failure, Iterable<ToDo>>> call(ToDoType params) {
    return toDoReository.getAllToDos(params);
  }
}
