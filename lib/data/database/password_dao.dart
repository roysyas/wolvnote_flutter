import 'package:drift/drift.dart';
import 'password_table.dart';
import 'app_database.dart';
part 'password_dao.g.dart';

@DriftAccessor(tables: [PasswordTable])
class PasswordDao extends DatabaseAccessor<AppDatabase> with _$PasswordDaoMixin{
  PasswordDao(super.db);

  Future<password_table?> getPassword(){
    return (select(passwordTable)
        ..orderBy([
              (t) => OrderingTerm.desc(t.passwordId),
        ])
        ..limit(1)
    ).getSingleOrNull();
  }

  Future<int> insertPassword(PasswordTableCompanion entity){
    return into(passwordTable).insert(entity);
  }
}