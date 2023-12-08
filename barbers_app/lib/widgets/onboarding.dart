import 'package:barbers_app/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.deepPurple,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OnboardingContent(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
