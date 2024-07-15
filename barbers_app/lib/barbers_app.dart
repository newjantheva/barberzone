import 'package:barbers_app/blocs/barber_bloc/barber_bloc.dart';
import 'package:barbers_app/blocs/barber_bloc/barber_bloc.dart';
import 'package:barbers_app/get_it.dart';
import 'package:barbers_app/screens/home_screen.dart';
import 'package:barbers_app/screens/customer_login_page.dart';
import 'package:barbers_app/screens/login_page.dart';
import 'package:barbers_app/screens/map_screen.dart';
import 'package:barbers_app/screens/profile_screen.dart';
import 'package:barbers_app/screens/search_screen.dart';
import 'package:barbers_app/screens/sign_up_page.dart';
import 'package:barbers_app/screens/splash_screen.dart';
import 'package:barbers_app/service/barber_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BarbersApp extends StatelessWidget {
  const BarbersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(
            repository: BarberRepository(
              BarberService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => BarberBloc(
            repository: BarberRepository(
              BarberService(),
            ),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          fontFamily: GoogleFonts.getFont('Montserrat').fontFamily,
        ),
        routes: {
          '/': (context) => const SplashScreen(
                child: LoginPage(),
              ),
          LoginPage.route: (context) => const LoginPage(),
          '/signUp': (context) => const SignUpPage(),
          '/home': (context) => const HomeScreen(),
          '/map': (context) => const MapScreen(),
          '/search': (context) => const SearchScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/employees': (context) => const EmployeesScreen(),
          '/booking': (context) => const BookingScreen(title: "test"),
          '/createbarber': (context) => const CreateBarberScreen(),
        },
      ),
    );
  }
}
