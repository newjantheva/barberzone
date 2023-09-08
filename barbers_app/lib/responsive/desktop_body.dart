import 'package:barbers_app/screens/configuration.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/dashboard.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({
    super.key,
  });

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  // Variable to track the current selected navigation item
  int _selectedNavItemIndex = 0;

// List of pages to display in the body
  final List<Widget> _pages = [
    Configuration()
    // Dashboard(),
  ];

  // Function to update the selected navigation item index
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedNavItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      // body: _pages[_selectedNavItemIndex],
      // body: _pages[_selectedNavItemIndex],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            Drawer(
              backgroundColor: Colors.white,
              elevation: 0,
              child: Column(
                children: [
                  DrawerHeader(
                    child: Icon(
                      Icons.favorite,
                      size: 64,
                    ),
                  ),
                  Padding(
                    padding: tilePadding,
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text(
                        'D A S H B O A R D',
                        style: drawerTextColor,
                      ),
                      onTap: () => _onNavItemTapped(0),
                      selected: _selectedNavItemIndex == 0,
                    ),
                  ),
                  Padding(
                    padding: tilePadding,
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        'S E T T I N G S',
                        style: drawerTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: tilePadding,
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text(
                        'A B O U T',
                        style: drawerTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: tilePadding,
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'L O G O U T',
                        style: drawerTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: _pages[_selectedNavItemIndex])
          ],
        ),
      ),
    );
  }
}
