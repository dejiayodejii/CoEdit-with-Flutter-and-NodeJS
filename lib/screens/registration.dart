import 'package:collaborating_editing_app/common/custom_button.dart';
import 'package:collaborating_editing_app/common/custom_textfield.dart';
import 'package:collaborating_editing_app/controller/auth_controller.dart';
import 'package:collaborating_editing_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              labelText: 'Full Name',
              hintText: 'John Doe',
            ),
            CustomTextField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'example@gmail.com',
            ),
            CustomTextField(
              controller: phoneController,
              labelText: 'Phone Number',
              hintText: '081xxxxxxxx',
            ),
            CustomTextField(
              controller: passwordController,
              labelText: 'Password',
            ),
            CustomButton(
              isLoading: authState.isLoading,
              text: 'Sign Up',
              onPressed: () {
                authNotifier.registration(
                  onSuccess: _naviagtetoHome,
                    name: nameController.text,
                    email: emailController.text.trim(),
                    password: passwordController.text,
                    phoneNumber: phoneController.text);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

    void _naviagtetoHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
