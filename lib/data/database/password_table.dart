import 'package:drift/drift.dart';

@DataClassName('password_table')
class PasswordTable extends Table{
  IntColumn get passwordId => integer().autoIncrement()();
  TextColumn get password => text()();
  TextColumn get hint => text()();
}