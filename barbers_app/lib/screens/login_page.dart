import 'package:barbers_app/widgets/onboarding_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingScreen(),
    );
  }
}
