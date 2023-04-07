import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';

part 'to_do_type_state.dart';

class ToDoTypeCubit extends Cubit<ToDoTypeState> {
  ToDoTypeCubit() : super(const ToDoTypeAll());

  void onTap(ToDoType toDoType) {
    switch (toDoType) {
      case ToDoType.all:
        emit(const ToDoTypeAll());
        break;
      case ToDoType.notDone:
        emit(const ToDoTypeNotDone());
        break;
      case ToDoType.done:
        emit(const ToDoTypeDone());
        break;
    }
  }
}
