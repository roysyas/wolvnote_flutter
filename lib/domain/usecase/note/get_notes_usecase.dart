import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/domain/repository/note_repository.dart';

class GetNotesUseCase{
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<NoteEntity>> call(){
    return repository.getNotes();
  }
}