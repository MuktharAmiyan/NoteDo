import 'package:fpdart/fpdart.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/todo/data/model/to_do_model.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';

abstract class ToDoRepository {
  Future<Either<Failure, Iterable<ToDo>>> getAllToDos(ToDoType toDoType);
  Future<Either<Failure, Unit>> addToDo(ToDoModel toDoModel);
  Future<Either<Failure, Unit>> deleteToDo(ToDoModel toDoModel);
  Future<Either<Failure, Unit>> toggleToDo(ToDoModel toDoModel);
}
