import 'package:wolvnote_flutter/domain/model/password_entity.dart';
import 'package:wolvnote_flutter/domain/repository/password_repository.dart';

class GetPasswordUseCase{
  final PasswordRepository repository;

  GetPasswordUseCase(this.repository);

  Future<PasswordEntity> call(){
    return repository.getPassword();
  }
}