import 'package:notedo/core/error/failure.dart';
import 'package:notedo/feature/note/data/model/note_model.dart';
import 'package:notedo/feature/note/domain/entities/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

abstract class NoteLocalDataSource {
  Future<Iterable<NoteModel>> getAllNotes();
  Future<void> addNote(NoteModel note);
  Future<void> editNote(NoteModel note);
  Future<void> deleteNote(Note note);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'notedo.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE ${NoteModelFieldName.tableName} (
            ${NoteModelFieldName.id} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
            ${NoteModelFieldName.title} TEXT ,
            ${NoteModelFieldName.noteText} TEXT ,
            ${NoteModelFieldName.createdAt} TEXT NOT NULL 
          )
          ''');
  }

  @override
  Future<void> addNote(NoteModel note) async {
    final db = await database;
    try {
      await db.insert(
        NoteModelFieldName.tableName,
        note.toJson(),
      );
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }

  @override
  Future<void> deleteNote(Note note) async {
    final db = await database;
    try {
      await db.delete(
        NoteModelFieldName.tableName,
        where: '${NoteModelFieldName.id} = ?',
        whereArgs: [note.id],
      );
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }

  @override
  Future<void> editNote(NoteModel note) async {
    final db = await database;
    try {
      await db.update(
        NoteModelFieldName.tableName,
        note.toJson(),
        where: '${NoteModelFieldName.id} = ?',
        whereArgs: [note.id],
      );
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }

  @override
  Future<Iterable<NoteModel>> getAllNotes() async {
    final db = await database;
    try {
      final map = await db.query(NoteModelFieldName.tableName);
      return map
          .map(
            (e) => NoteModel.fromJson(e),
          )
          .toList()
          .reversed;
    } catch (e) {
      throw LocalDataSourceFailure();
    }
  }
}
