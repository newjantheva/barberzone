import 'package:barbers_app/screens/booking_screen.dart';
import 'package:barbers_app/screens/employees_screen.dart';
import 'package:barbers_app/screens/home_screen.dart';
import 'package:barbers_app/screens/map_screen.dart';
import 'package:barbers_app/screens/profile_screen.dart';
import 'package:barbers_app/screens/search_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/map': (context) => MapScreen(),
        '/search': (context) => SearchScreen(),
        '/profile': (context) => ProfileScreen(),
        '/employees': (context) => EmployeesScreen(),
        '/booking': (context) => BookingScreen(title: "test"),
      },
    );
  }
}
