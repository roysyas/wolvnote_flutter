import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/domain/repository/note_repository.dart';

class UpdateNoteUseCase{
  final NoteRepository repository;

  UpdateNoteUseCase(this.repository);

  Future call(NoteEntity entity){
    return repository.updateNote(entity);
  }
}