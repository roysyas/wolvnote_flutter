import 'package:wolvnote_flutter/domain/model/password_entity.dart';

abstract class PasswordRepository{
  Future<PasswordEntity> getPassword();
  Future<int> insertPassword(PasswordEntity entity);
}