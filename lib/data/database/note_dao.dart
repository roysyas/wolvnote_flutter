import 'package:drift/drift.dart';
import 'note_table.dart';
import 'app_database.dart';
part 'note_dao.g.dart';

@DriftAccessor(tables: [NoteTable])
class NoteDao extends DatabaseAccessor<AppDatabase> with _$NoteDaoMixin{
  NoteDao(super.db);

  Future<int> insertNote(NoteTableCompanion entity){
    return into(noteTable).insert(entity);
  }

  Future<int> deleteNote(int id){
    return (delete(noteTable)..where((t)=> t.noteId.equals(id))).go();
  }

  Future<List<note_table>> getNotes() => select(noteTable).get();

  Future<note_table> getNote(int id){
    return (select(noteTable)
        ..where((t) => t.noteId.equals(id))
    ).getSingle();
  }

  Future updateNote(NoteTableCompanion entity) {
    return update(noteTable).replace(entity);
  }
}