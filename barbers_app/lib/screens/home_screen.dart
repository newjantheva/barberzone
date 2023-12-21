import 'package:barbers_app/blocs/barber_bloc/barber_bloc.dart';
import 'package:barbers_app/global/common/toast.dart';
import 'package:barbers_app/models/navigation_item.dart';
import 'package:barbers_app/screens/create_barber_screen.dart';
import 'package:barbers_app/screens/map_screen.dart';
import 'package:barbers_app/screens/profile_screen.dart';
import 'package:barbers_app/screens/search_screen.dart';
import 'package:barbers_app/widgets/home_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  void _openCreateBarberScreen() {
    Navigator.pushNamed(context, CreateBarberScreen.route);
  }

  final _navigationItems = [
    NavigationItem(
      "Home",
      const Icon(Icons.home),
      const HomeList(),
    ),
    NavigationItem(
      "Profile",
      const Icon(Icons.map),
      const MapScreen(),
    ),
    NavigationItem(
      "Search",
      const Icon(Icons.search),
      const SearchScreen(),
    ),
    NavigationItem(
      "Profile",
      const Icon(Icons.person),
      const ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
              showToast(message: "Successfully signed out");
            },
            icon: const Icon(Icons.logout_rounded),
          ),
          IconButton(
              onPressed: _openCreateBarberScreen, icon: const Icon(Icons.add))
        ],
      ),
      body: PageView(
        pageSnapping: false,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: controller,
        children: [
          ..._navigationItems.map(
            (e) => e.page ?? Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
          controller.jumpToPage(_currentIndex);
        }),
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: _navigationItems
            .map(
              (e) => BottomNavigationBarItem(icon: e.icon!, label: e.label),
            )
            .toList(),
      ),
    );
  }
}
