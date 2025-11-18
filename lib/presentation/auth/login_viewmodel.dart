import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/presentation/auth/login_state.dart';

class LoginViewModel extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  Future<void> getPassword() async{
    state = state.copyWith(isLoading: true);
    final get = ref.read(getPasswordUseCaseProvider);
    final data = await get();
    state = state.copyWith(isLoading: false, passwordEntity: data);
  }

  Future<bool> checkPassword() async{
    final get = ref.read(getPasswordUseCaseProvider);
    final data = await get();
    return data.password?.isEmpty ?? true;
  }
}
