import 'package:barbers_app/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();


  // //TODO: Encrypt secrets
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyDIvrrsl2GYtQB4Yo7FW2LJe3es85RWoms",
  //         appId: "1:67964850932:web:6b0511c2fe082a430044a1",
  //         messagingSenderId: "67964850932",
  //         projectId: "barberzone-18b58"),
  //   );
  // }

  
  runApp(const Root());
}
