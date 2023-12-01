import 'package:barbers_app/widgets/landing_content.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({super.key});

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  late PageController _pageController;
  double _progress = 0;

  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        _onPageChanged();
      });

    super.initState();
  }

  void _onPageChanged() {
    setState(() {
      _progress = _pageController.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: 250 + _progress * 140,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (_) => _onPageChanged,
                  controller: _pageController,
                  children: [
                    const LandingContent(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, top: 25),
                            child: Text(
                              "Opret en konto",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 45.0,
                            left: 20,
                            right: 20,
                          ),
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.email),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.red,
                                        Colors.blue,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  height: 45,
                                  width: 100,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
