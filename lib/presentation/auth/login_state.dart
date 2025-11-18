import 'package:wolvnote_flutter/domain/model/password_entity.dart';

class LoginState{
  final bool isLoading;
  final PasswordEntity passwordEntity;
  const LoginState({this.isLoading = false, this.passwordEntity = const PasswordEntity()});

  LoginState copyWith({bool? isLoading, PasswordEntity? passwordEntity}) =>
      LoginState(isLoading: isLoading ?? this.isLoading, passwordEntity: passwordEntity ?? this.passwordEntity);

}