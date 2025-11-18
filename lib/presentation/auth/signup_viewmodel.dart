import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/domain/model/password_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/presentation/auth/signup_state.dart';

class SignUpViewModel extends Notifier<SignUpState>{
  @override
  SignUpState build() => const SignUpState();

  Future<void> insertPassword(PasswordEntity entity) async{
    state = state.copyWith(isSaving: true);
    final add = ref.read(insertPasswordUseCaseProvider);
    await add(entity);
    state = state.copyWith(isSaving: false);
  }
}