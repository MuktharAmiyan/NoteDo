import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'note_or_edit_state.dart';

class NoteOrEditCubit extends Cubit<NoteOrEditState> {
  NoteOrEditCubit()
      : super(
          const NoteViewState(),
        );

  void changeState() {
    emit(state.isEdit ? const NoteViewState() : const EditNoteState());
  }
}
