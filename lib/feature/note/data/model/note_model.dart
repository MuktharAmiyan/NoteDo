import 'package:notedo/feature/note/domain/entities/note.dart';

class NoteModel extends Note {
  const NoteModel(
      {super.id,
      required super.title,
      required super.noteText,
      required super.createdAt});

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json[NoteModelFieldName.id],
        title: json[NoteModelFieldName.title],
        noteText: json[NoteModelFieldName.noteText],
        createdAt: DateTime.parse(json[NoteModelFieldName.createdAt] as String),
      );
  Map<String, dynamic> toJson() => {
        NoteModelFieldName.id: id,
        NoteModelFieldName.title: title,
        NoteModelFieldName.noteText: noteText,
        NoteModelFieldName.createdAt: createdAt.toIso8601String(),
      };
  factory NoteModel.fromEntity(Note note) => NoteModel(
        id: note.id,
        title: note.title,
        noteText: note.noteText,
        createdAt: note.createdAt,
      );
}

class NoteModelFieldName {
  NoteModelFieldName._();
  static const tableName = 'note';
  static const id = 'id';
  static const title = 'title';
  static const noteText = 'noteText';
  static const createdAt = 'created_at';
}
