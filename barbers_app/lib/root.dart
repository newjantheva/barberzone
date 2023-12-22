import 'package:barbers_app/blocs/barber_bloc/barber_bloc.dart';
import 'package:barbers_app/blocs/search_bloc/search_bloc.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

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
          splashColor: Colors.transparent,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        routes: {
          '/': (context) => const SplashScreen(child: LoginPage(),),
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
