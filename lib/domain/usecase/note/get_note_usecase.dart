import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/domain/repository/note_repository.dart';

class GetNoteUseCase{
  final NoteRepository repository;

  GetNoteUseCase(this.repository);

  Future<NoteEntity> call(int id){
    return repository.getNote(id);
  }
}