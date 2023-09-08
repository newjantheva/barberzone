import 'package:flutter/material.dart';
import 'models/navigation_item.dart';
import 'responsive/desktop_body.dart';
import 'responsive/mobile_body.dart';
import 'responsive/responsive_layout.dart';
import 'responsive/tablet_body.dart';
import 'screens/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NavigationItem> navItems = [NavigationItem(page: Dashboard())];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, textTheme: GoogleFonts.robotoTextTheme()),
      home: ResponsiveLayout(
        mobileBody: MobileScaffold(),
        tabletBody: TabletScaffold(),
        desktopBody: DesktopScaffold(),
      ),
    );
  }
}
