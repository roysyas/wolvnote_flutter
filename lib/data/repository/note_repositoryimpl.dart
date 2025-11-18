import 'package:drift/drift.dart';
import 'package:wolvnote_flutter/data/database/app_database.dart';
import 'package:wolvnote_flutter/data/database/note_dao.dart';
import 'package:wolvnote_flutter/domain/model/note_entity.dart';
import 'package:wolvnote_flutter/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDao dao;

  NoteRepositoryImpl(this.dao);

  @override
  Future<int> deleteNote(int id) async {
    return await dao.deleteNote(id);
  }

  @override
  Future<NoteEntity> getNote(int id) async {
    final data = await dao.getNote(id);
    return NoteEntity(
      noteId: data.noteId,
      noteCategory: data.noteCategory,
      noteContent: data.noteContent,
      noteCreateDate: data.noteCreateDate,
      noteLastEditDate: data.noteLastEditDate,
      noteTitle: data.noteTitle,
    );
  }

  @override
  Future<List<NoteEntity>> getNotes() async {
    final data = await dao.getNotes();
    return data
        .map(
          (d) => NoteEntity(
            noteId: d.noteId,
            noteTitle: d.noteTitle,
            noteLastEditDate: d.noteLastEditDate,
            noteCreateDate: d.noteCreateDate,
            noteContent: d.noteContent,
            noteCategory: d.noteCategory,
          ),
        )
        .toList();
  }

  @override
  Future<int> insertNote(NoteEntity entity) async {
    return await dao.insertNote(
      NoteTableCompanion.insert(
        noteCreateDate: entity.noteCreateDate ?? '',
        noteTitle: entity.noteTitle ?? '',
        noteContent: entity.noteContent ?? '',
        noteCategory: entity.noteCategory ?? 0,
        noteLastEditDate: entity.noteLastEditDate ?? '',
      ),
    );
  }

  @override
  Future updateNote(NoteEntity entity) async {
    return await dao.updateNote(
      NoteTableCompanion.insert(
        noteId: Value(entity.noteId ?? 0),
        noteCreateDate: entity.noteCreateDate ?? '',
        noteTitle: entity.noteTitle ?? '',
        noteContent: entity.noteContent ?? '',
        noteCategory: entity.noteCategory ?? 0,
        noteLastEditDate: entity.noteLastEditDate ?? '',
      ),
    );
  }
}
