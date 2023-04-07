import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final int? id;
  final String title;
  final DateTime dateTime;
  final bool isDone;
  const ToDo({
    this.id,
    required this.title,
    required this.dateTime,
    required this.isDone,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        dateTime,
        isDone,
      ];
}

enum ToDoType {
  all,
  done,
  notDone,
}
