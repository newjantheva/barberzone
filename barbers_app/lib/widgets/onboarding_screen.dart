import 'package:barbers_app/global/common/toast.dart';
import 'package:barbers_app/services/firebase_auth_services.dart';
import 'package:barbers_app/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSigningUp = false;

  late PageController _pageController;
  double _progress = 0;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        _onPageChanged(_currentPage);
      });

    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() {
      _progress = _pageController.page ?? 0;
      _currentPage = page;
    });
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      showToast(message: "some error occured");
    }
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushReplacementNamed(context, "/home");
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
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
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              onPageChanged: (page) => _onPageChanged,
                              controller: _pageController,
                              children: [
                                _buildFirstPage(),
                                _buildSecondPage(),
                                _buildThirdPage(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildThirdPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        FormContainerWidget(
          controller: _usernameController,
          hintText: "Username",
          isPasswordField: false,
        ),
        SizedBox(
          height: 10,
        ),
        FormContainerWidget(
          controller: _emailController,
          hintText: "Email",
          isPasswordField: false,
        ),
        SizedBox(
          height: 10,
        ),
        FormContainerWidget(
          controller: _passwordController,
          hintText: "Password",
          isPasswordField: true,
        ),
        GestureDetector(
          onTap: () {
            _signUp();
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: isSigningUp
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Sign Up",
                      )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
              child: const Text(
                "Login",
              ),
            )
          ],
        )
      ],
    );
  }

  Column _buildSecondPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        FormContainerWidget(
          controller: _emailController,
          hintText: "Email",
          isPasswordField: false,
        ),
        SizedBox(
          height: 10,
        ),
        FormContainerWidget(
          controller: _passwordController,
          hintText: "Password",
          isPasswordField: true,
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            _signIn();
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: _isSigning
                  ? CircularProgressIndicator()
                  : Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            _signInWithGoogle();
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Sign in with Google",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceIn);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildFirstPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            "Bestil en fade i nærheden",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            "Hold styr på dine ugentlige klipninger med barberzone app lige ved lommen",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 50),
        InkWell(
          onTap: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceIn,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              height: 50,
              width: 100,
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Start",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                    )
                  ],
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
