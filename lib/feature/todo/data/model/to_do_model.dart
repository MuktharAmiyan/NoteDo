import 'package:notedo/feature/todo/domain/entities/to_do.dart';

class ToDoModel extends ToDo {
  const ToDoModel(
      {super.id,
      required super.title,
      required super.dateTime,
      required super.isDone});

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        id: json[ToDoModelFeildName.id],
        title: json[ToDoModelFeildName.title],
        dateTime: DateTime.parse(json[ToDoModelFeildName.dateTime]),
        isDone: json[ToDoModelFeildName.isDone] == 1,
      );
  factory ToDoModel.fromEntity(ToDo toDo) => ToDoModel(
        id: toDo.id,
        title: toDo.title,
        dateTime: toDo.dateTime,
        isDone: toDo.isDone,
      );

  Map<String, dynamic> toJson() => {
        ToDoModelFeildName.id: id,
        ToDoModelFeildName.title: title,
        ToDoModelFeildName.dateTime: dateTime.toIso8601String(),
        ToDoModelFeildName.isDone: isDone ? 1 : 0,
      };
}

class ToDoModelFeildName {
  ToDoModelFeildName._();
  static const id = 'id';
  static const title = 'title';
  static const dateTime = 'datetime';
  static const isDone = 'is_done';
  static const tableName = 'todo';
}
