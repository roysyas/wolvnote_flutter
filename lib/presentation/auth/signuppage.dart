import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/domain/model/password_entity.dart';
import 'package:wolvnote_flutter/presentation/auth/loginpage.dart';
import 'package:wolvnote_flutter/presentation/ui/custom_widgets/outline_textformfield.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpViewModelProvider);
    final vm = ref.read(signUpViewModelProvider.notifier);

    final passwordController = TextEditingController();
    final hintController = TextEditingController();

    void insertAuth() async {
      if (!state.isSaving) {
        if (passwordController.text.isEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('password is empty')));
        } else if (hintController.text.isEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('hint is empty')));
        } else {
          await vm.insertPassword(
            PasswordEntity(
              password: passwordController.text,
              hint: hintController.text,
            ),
          );

          Navigator.pushReplacement(
            mounted ? context : context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlineTextFormField(
                  label: 'Password',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16),
                OutlineTextFormField(
                  label: 'Hint',
                  controller: hintController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 32),
                OutlinedButton(
                  onPressed: insertAuth,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: state.isSaving
                      ? const CircularProgressIndicator()
                      : const Text('SignUp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
