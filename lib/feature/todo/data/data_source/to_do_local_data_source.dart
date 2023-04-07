import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/todo/data/model/to_do_model.dart';
import 'package:notedo/feature/todo/domain/entities/to_do.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class ToDoLocalDataSource {
  Future<Iterable<ToDo>> getAllToDos(ToDoType toDoType);
  Future<void> addToDo(ToDoModel toDoModel);
  Future<void> deleteToDo(ToDoModel toDoModel);
  Future<void> toggleToDo(ToDoModel toDoModel);
}

class ToDoLocalDataSourceImpl extends ToDoLocalDataSource {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'notedo.todo.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${ToDoModelFeildName.tableName} (
          ${ToDoModelFeildName.id} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
          ${ToDoModelFeildName.title} TEXT NOT NULL ,
          ${ToDoModelFeildName.isDone} BOOLEAN NOT NULL ,
          ${ToDoModelFeildName.dateTime} TEXT NOT NULL
        )
''');
  }

  @override
  Future<void> addToDo(ToDoModel toDoModel) async {
    final db = await database;
    try {
      await db.insert(
        ToDoModelFeildName.tableName,
        toDoModel.toJson(),
      );
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }

  @override
  Future<void> deleteToDo(ToDoModel toDoModel) async {
    final db = await database;
    try {
      await db.delete(
        ToDoModelFeildName.tableName,
        where: '${ToDoModelFeildName.id} = ?',
        whereArgs: [toDoModel.id],
      );
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }

  @override
  Future<Iterable<ToDo>> getAllToDos(ToDoType toDoType) async {
    final db = await database;
    try {
      final map = await db.query(ToDoModelFeildName.tableName);
      return map
          .map(
            (element) => ToDoModel.fromJson(element),
          )
          .where((e) {
            switch (toDoType) {
              case ToDoType.all:
                return true;
              case ToDoType.notDone:
                return e.isDone == false;
              case ToDoType.done:
                return e.isDone == true;
            }
          })
          .toList()
          .reversed;
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }

  @override
  Future<void> toggleToDo(ToDoModel toDoModel) async {
    final db = await database;
    try {
      await db.update(
        ToDoModelFeildName.tableName,
        toDoModel.toJson(),
        where: '${ToDoModelFeildName.id} = ?',
        whereArgs: [toDoModel.id],
      );
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }
}
