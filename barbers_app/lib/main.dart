import 'package:barbers_app/get_it.dart';
import 'package:barbers_app/barbers_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await setupGetIt();

  runApp(const BarbersApp());
}
