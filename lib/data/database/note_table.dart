import 'package:drift/drift.dart';

@DataClassName('note_table')
class NoteTable extends Table{
  IntColumn get noteId => integer().autoIncrement()();
  TextColumn get noteCreateDate => text()();
  TextColumn get noteTitle => text()();
  TextColumn get noteContent => text()();
  IntColumn get noteCategory => integer()();
  TextColumn get noteLastEditDate => text()();
}