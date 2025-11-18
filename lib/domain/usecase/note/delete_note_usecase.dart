import 'package:wolvnote_flutter/domain/repository/note_repository.dart';

class DeleteNoteUseCase{
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<int> call(int id){
    return repository.deleteNote(id);
  }
}