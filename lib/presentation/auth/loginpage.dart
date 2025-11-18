import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wolvnote_flutter/di/providers.dart';
import 'package:wolvnote_flutter/presentation/auth/signuppage.dart';
import 'package:wolvnote_flutter/presentation/note/home/home_page.dart';
import 'package:wolvnote_flutter/presentation/ui/custom_widgets/green_label.dart';
import 'package:wolvnote_flutter/presentation/ui/custom_widgets/outline_textformfield.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async{
      final vm = ref.read(loginViewModelProvider.notifier);
      await vm.getPassword();
      final check = await vm.checkPassword();
      if(check && mounted){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignUpPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);

    final passwordController = TextEditingController();

    void checkPassword() async {
      if (!state.isLoading) {
        if (passwordController.text.isNotEmpty &&
            state.passwordEntity.password == passwordController.text &&
            mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed!')),
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
                  GreenLabel(label:
                  state.isLoading
                      ? 'password hint'
                      : state.passwordEntity.hint ?? 'password hint'
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: checkPassword,
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size.fromHeight(50)
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
