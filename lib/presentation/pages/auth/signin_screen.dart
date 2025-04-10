import 'package:d2y_flutter_bloc/core/common/app_routes.dart';
import 'package:d2y_flutter_bloc/presentation/widgets/custom_textfield.dart';
import 'package:d2y_flutter_bloc/presentation/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.h_mobiledata, size: 60, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sign in your account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const CustomTextField(hintText: "Email"),
            const SizedBox(height: 10),
            const CustomTextField(hintText: "Password", obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "SIGN IN",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "or sign in with",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),
            const SocialButtons(),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.SIGNUP_ROUTE_PATH),
                child: const Text(
                  "Don't have an account? SIGN UP",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
