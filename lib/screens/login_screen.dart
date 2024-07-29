// import 'package:collaborating_editing_app/common/custom_button.dart';
// import 'package:collaborating_editing_app/common/custom_textfield.dart';
// import 'package:collaborating_editing_app/controller/auth_controller.dart';
// import 'package:collaborating_editing_app/screens/home_screen.dart';
// import 'package:collaborating_editing_app/screens/registration.dart';
// import 'package:collaborating_editing_app/utils/validator_mixin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends ConsumerState<LoginScreen> with ValidatorMixin {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();

//     super.dispose();
//   }

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(authProvider);
//     final authNotifier = ref.read(authProvider.notifier);
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Sign In',
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 CustomTextField(
//                   controller: emailController,
//                   validator: validateEmail,
//                   labelText: 'Email',
//                 ),
//                 CustomTextField(
//                   controller: passwordController,
//                   validator: validateNotEmpty,
//                   labelText: 'Password',
//                 ),
//                 CustomButton(
//                   text: 'Login',
//                   isLoading: authState.isLoading,
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       authNotifier.login(
//                           email: emailController.text.toLowerCase().trim(),
//                           password: passwordController.text.trim(),
//                           onSuccess: _naviagtetoHome);
//                     }
//                   },
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   const RegistrationScreen()));
//                     },
//                     child: const Text('Sign up'))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _naviagtetoHome() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const HomeScreen()));
//   }
// }
