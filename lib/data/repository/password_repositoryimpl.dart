import 'package:wolvnote_flutter/data/database/app_database.dart';
import 'package:wolvnote_flutter/data/database/password_dao.dart';
import 'package:wolvnote_flutter/domain/model/password_entity.dart';
import 'package:wolvnote_flutter/domain/repository/password_repository.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final PasswordDao dao;

  PasswordRepositoryImpl(this.dao);

  @override
  Future<PasswordEntity> getPassword() async {
    final data = await dao.getPassword();
    return PasswordEntity(
      passwordId: data?.passwordId,
      password: data?.password,
      hint: data?.hint,
    );
  }

  @override
  Future<int> insertPassword(PasswordEntity entity) {
    return dao.insertPassword(
      PasswordTableCompanion.insert(
        password: entity.password ?? '',
        hint: entity.hint ?? '',
      ),
    );
  }
}
