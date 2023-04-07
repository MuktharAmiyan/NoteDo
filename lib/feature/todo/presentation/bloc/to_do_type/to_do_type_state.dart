part of 'to_do_type_cubit.dart';

abstract class ToDoTypeState extends Equatable {
  final ToDoType toDoType;
  const ToDoTypeState(
    this.toDoType,
  );

  @override
  List<Object> get props => [toDoType];
}

class ToDoTypeAll extends ToDoTypeState {
  const ToDoTypeAll() : super(ToDoType.all);
}

class ToDoTypeNotDone extends ToDoTypeState {
  const ToDoTypeNotDone() : super(ToDoType.notDone);
}

class ToDoTypeDone extends ToDoTypeState {
  const ToDoTypeDone() : super(ToDoType.done);
}
