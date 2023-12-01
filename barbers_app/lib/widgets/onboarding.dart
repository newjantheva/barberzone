import 'package:barbers_app/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            // SvgPicture.asset("assets/images/configuration_bg.jpg"),
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
