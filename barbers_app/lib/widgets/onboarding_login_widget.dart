// import 'package:barbers_app/widgets/form_container_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class OnboardingLoginWidget extends StatelessWidget {
//   const OnboardingLoginWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 50,
//         ),
//         FormContainerWidget(
//           controller: _emailController,
//           hintText: "Email",
//           isPasswordField: false,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         FormContainerWidget(
//           controller: _passwordController,
//           hintText: "Password",
//           isPasswordField: true,
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         GestureDetector(
//           onTap: () {
//             _signIn();
//           },
//           child: Container(
//             width: double.infinity,
//             height: 45,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: _isSigning
//                   ? CircularProgressIndicator(
//                       color: Colors.white,
//                     )
//                   : Text(
//                       "Login",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         GestureDetector(
//           onTap: () {
//             _signInWithGoogle();
//           },
//           child: Container(
//             width: double.infinity,
//             height: 45,
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     FontAwesomeIcons.google,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     "Sign in with Google",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Don't have an account?"),
//             SizedBox(
//               width: 5,
//             ),
//             GestureDetector(
//               onTap: () {
//                 _pageController.nextPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.bounceIn);
//               },
//               child: const Text(
//                 "Sign Up",
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
