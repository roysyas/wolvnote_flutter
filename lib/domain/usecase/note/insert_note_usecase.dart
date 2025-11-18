import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/domain/repository/note_repository.dart';

class InsertNoteUseCase{
  NoteRepository repository;

  InsertNoteUseCase(this.repository);

  Future<int> call(NoteEntity entity){
    return repository.insertNote(entity);
  }
}