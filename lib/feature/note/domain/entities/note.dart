import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int? id;
  final String title;
  final String noteText;
  final DateTime createdAt;
  const Note({
    this.id,
    required this.title,
    required this.noteText,
    required this.createdAt,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        noteText,
        createdAt,
      ];
}
