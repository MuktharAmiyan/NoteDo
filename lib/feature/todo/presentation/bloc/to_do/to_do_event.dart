part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable {
  final ToDoType toDoType;
  const ToDoEvent(this.toDoType);

  @override
  List<Object> get props => [];
}

class GetToDosEvent extends ToDoEvent {
  const GetToDosEvent(super.toDoType);
  @override
  List<Object> get props => [toDoType];
}

class DeleteToDosEvent extends ToDoEvent {
  final ToDo toDo;
  const DeleteToDosEvent(super.toDoType, {required this.toDo});
  @override
  List<Object> get props => [toDo];
}

class AddToDoEvent extends ToDoEvent {
  final String title;
  const AddToDoEvent(super.toDoType, {required this.title});
  @override
  List<Object> get props => [title];
}

class ToggleToDosEvent extends ToDoEvent {
  final bool isDone;
  final ToDo toDo;
  const ToggleToDosEvent(
    super.toDoType, {
    required this.isDone,
    required this.toDo,
  });
  @override
  List<Object> get props => [
        isDone,
        toDo,
      ];
}
