import 'package:wolvnote_flutter/domain/model/note_entity.dart';

abstract class NoteRepository{
  Future<int> insertNote(NoteEntity entity);
  Future<int> deleteNote(int id);
  Future<List<NoteEntity>> getNotes();
  Future<NoteEntity> getNote(int id);
  Future updateNote(NoteEntity entity);
}