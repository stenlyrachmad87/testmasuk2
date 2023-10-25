import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmasuk2/controllers/auth_controller.dart';

class GoogleSigninPage extends GetView<AuthController> {
  const GoogleSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign in"),
            ElevatedButton(
              onPressed: controller.signInWithGoogle,
              child: const Text("Masuk dengan Google Account"),
            ),
          ],
        ),
      ),
    );
  }
}
