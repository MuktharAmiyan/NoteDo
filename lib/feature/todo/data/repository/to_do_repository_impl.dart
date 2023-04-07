import 'package:fpdart/fpdart.dart';
import 'package:notedo/feature/todo/data/data_source/to_do_local_data_source.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/data/model/to_do_model.dart';
import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/todo/domain/repository/to_do_repository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final ToDoLocalDataSource toDoLocalDataSource;
  ToDoRepositoryImpl(this.toDoLocalDataSource);
  @override
  Future<Either<Failure, Unit>> addToDo(ToDoModel toDoModel) async {
    try {
      await toDoLocalDataSource.addToDo(toDoModel);
      return right(unit);
    } catch (e) {
      return left(LocalDataSourceFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteToDo(ToDoModel toDoModel) async {
    try {
      await toDoLocalDataSource.deleteToDo(toDoModel);
      return right(unit);
    } catch (e) {
      return left(LocalDataSourceFailure());
    }
  }

  @override
  Future<Either<Failure, Iterable<ToDo>>> getAllToDos(ToDoType toDoType) async {
    try {
      final res = await toDoLocalDataSource.getAllToDos(toDoType);
      return right(res);
    } catch (e) {
      return left(
        LocalDataSourceFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleToDo(ToDoModel toDoModel) async {
    try {
      await toDoLocalDataSource.toggleToDo(toDoModel);
      return right(unit);
    } catch (e) {
      return left(
        LocalDataSourceFailure(),
      );
    }
  }
}
