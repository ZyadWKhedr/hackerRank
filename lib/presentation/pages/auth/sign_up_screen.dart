import 'package:flutter/material.dart';
import 'package:hackerrank/presentation/widgets/custom_text_formfield.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              hintText: "Enter your name",
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: emailController,
              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: passwordController,
              hintText: "Enter your password",
              isPassword: true,
              prefixIcon: Icons.lock,
            ),
          ],
        ),
      ),
    );
  }
}
