import 'package:notedo/feature/note/domain/entities/note.dart';

class NoteModel extends Note {
  const NoteModel(
      {required super.id,
      required super.title,
      required super.noteText,
      required super.createdAt});

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json[NoteModelFieldName.id],
        title: json[NoteModelFieldName.title],
        noteText: json[NoteModelFieldName.noteText],
        createdAt: json[NoteModelFieldName.createdAt] as DateTime,
      );
  Map<String, dynamic> toJson() => {
        NoteModelFieldName.id: id,
        NoteModelFieldName.title: title,
        NoteModelFieldName.noteText: noteText,
        NoteModelFieldName.createdAt: createdAt.toIso8601String(),
      };
}

class NoteModelFieldName {
  NoteModelFieldName._();
  static const id = 'id';
  static const title = 'title';
  static const noteText = 'noteText';
  static const createdAt = 'created_at';
}
