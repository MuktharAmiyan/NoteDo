import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:notedo/feature/todo/domain/use_case/add_to_do_usecase.dart';
import 'package:notedo/feature/todo/domain/use_case/delete_to_usecase.dart';
import 'package:notedo/feature/todo/domain/use_case/get_all_todos_usecase.dart';
import 'package:notedo/feature/todo/domain/use_case/toggle_to_do_usecase.dart';
import 'package:notedo/feature/todo/presentation/bloc/to_do/to_do_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final GetAllToDosUsecase getAllToDosUsecase;
  final AddToDoUsecase addToDoUsecase;
  final DeleteToDoUsecase deleteToDoUsecase;
  final ToggleToDoUsecase toggleToDoUsecase;
  ToDoBloc({
    required this.getAllToDosUsecase,
    required this.addToDoUsecase,
    required this.deleteToDoUsecase,
    required this.toggleToDoUsecase,
  }) : super(const ToDoInitialState()) {
    on<GetToDosEvent>((event, emit) async {
      emit(const ToDoLoadingState());
      final res = await getAllToDosUsecase.call(event.toDoType);
      emit(
        res.fold(
          (l) => const FetchToDoErrorState(),
          (r) => ToDoLoadedState(r),
        ),
      );
    });

    on<AddToDoEvent>((event, emit) async {
      final toDo = ToDo(
        title: event.title,
        dateTime: DateTime.now(),
        isDone: false,
      );
      final res = await addToDoUsecase.call(toDo);
      final toDos = await getAllToDosUsecase.call(event.toDoType);
      emit(
        res.fold(
          (l) => const AddToDoErrorState(),
          (r) => toDos.fold(
            (l) => const FetchToDoErrorState(),
            (r) => ToDoLoadedState(r),
          ),
        ),
      );
    });

    on<DeleteToDosEvent>((event, emit) async {
      final res = await deleteToDoUsecase.call(event.toDo);
      final toDos = await getAllToDosUsecase.call(event.toDoType);
      emit(
        res.fold(
          (l) => const DeleteToDoErrorState(),
          (r) => toDos.fold(
            (l) => const FetchToDoErrorState(),
            (r) => ToDoLoadedState(r),
          ),
        ),
      );
    });

    on<ToggleToDosEvent>((event, emit) async {
      final newToDo = ToDo(
        id: event.toDo.id,
        title: event.toDo.title,
        dateTime: event.toDo.dateTime,
        isDone: event.isDone,
      );
      final res = await toggleToDoUsecase.call(newToDo);
      final toDos = await getAllToDosUsecase.call(event.toDoType);
      emit(
        res.fold(
          (l) => const DeleteToDoErrorState(),
          (r) => toDos.fold(
            (l) => const FetchToDoErrorState(),
            (r) => ToDoLoadedState(r),
          ),
        ),
      );
    });
  }
}
