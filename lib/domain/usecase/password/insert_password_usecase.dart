import 'package:wolvnote_flutter/domain/model/password_entity.dart';
import 'package:wolvnote_flutter/domain/repository/password_repository.dart';

class InsertPasswordUseCase{
  final PasswordRepository repository;
  
  InsertPasswordUseCase(this.repository);
  
  Future<int> call(PasswordEntity entity){
    return repository.insertPassword(entity);
  }
}