import 'package:barbers_app/global/common/toast.dart';
import 'package:barbers_app/models/navigation_item.dart';
import 'package:barbers_app/repo/barber_repository.dart';
import 'package:barbers_app/screens/create_barber_screen.dart';
import 'package:barbers_app/screens/map_screen.dart';
import 'package:barbers_app/screens/profile_screen.dart';
import 'package:barbers_app/screens/search_screen.dart';
import 'package:barbers_app/service/barber_service.dart';
import 'package:barbers_app/widgets/home_barbershop_carousel.dart';
import 'package:barbers_app/widgets/home_haircuts_carousel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

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
      const HomeScreenContent(),
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Welcome",
            style: TextStyle(fontWeight: FontWeight.bold)),
        foregroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IndexedStack(
          index: _currentIndex,
          children: [
            ..._navigationItems.map((e) => e.page!).toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 255, 98, 7),
        unselectedItemColor: Colors.white,
        items: _navigationItems
            .map(
              (e) => BottomNavigationBarItem(icon: e.icon!, label: e.label),
            )
            .toList(),
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 200, width: double.infinity, child: HomeHaircutsCarousel()),
        SizedBox(height: 30),
        Text("Barbershop",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        SizedBox(height: 15),
        Expanded(child: HomeBarbershopCarousel()),
        SizedBox(height: 30),
      ],
    );
  }
}
