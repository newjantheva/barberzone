import 'package:barbers_app/repo/barber_repository.dart';
import 'package:barbers_app/screens/booking_screen.dart';
import 'package:barbers_app/screens/create_barber_screen.dart';
import 'package:barbers_app/screens/employees_screen.dart';
import 'package:barbers_app/screens/home_screen.dart';
import 'package:barbers_app/screens/login_page.dart';
import 'package:barbers_app/screens/map_screen.dart';
import 'package:barbers_app/screens/profile_screen.dart';
import 'package:barbers_app/screens/search_screen.dart';
import 'package:barbers_app/screens/sign_up_page.dart';
import 'package:barbers_app/screens/splash_screen.dart';
import 'package:barbers_app/service/barber_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        LoginPage.route : (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomeScreen(),
        '/map': (context) => const MapScreen(),
        '/search': (context) => const SearchScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/employees': (context) => EmployeesScreen(),
        '/booking': (context) => BookingScreen(title: "test"),
        '/createbarber' :(context) => const CreateBarberScreen(),
      },
    );
  }
}
