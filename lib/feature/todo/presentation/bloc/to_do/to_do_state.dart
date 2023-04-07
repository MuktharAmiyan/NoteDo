part of 'to_do_bloc.dart';

abstract class ToDoState extends Equatable {
  const ToDoState();

  @override
  List<Object> get props => [];
}

class ToDoInitialState extends ToDoState {
  const ToDoInitialState();
}

class ToDoLoadedState extends ToDoState {
  final Iterable<ToDo> toDos;
  const ToDoLoadedState(
    this.toDos,
  );
}

class ToDoLoadingState extends ToDoState {
  const ToDoLoadingState();
}

class ToDoErrorState extends ToDoState {
  final String errorMessage;
  const ToDoErrorState(
    this.errorMessage,
  );
}

class AddToDoErrorState extends ToDoErrorState {
  const AddToDoErrorState()
      : super(
          'Error while add todo',
        );
}

class FetchToDoErrorState extends ToDoErrorState {
  const FetchToDoErrorState() : super('Error while fetch todos');
}

class DeleteToDoErrorState extends ToDoErrorState {
  const DeleteToDoErrorState() : super('Error while delete todo');
}

class ToggleToDoErrorState extends ToDoErrorState {
  const ToggleToDoErrorState() : super('Error while toggle todo');
}
