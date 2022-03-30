import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_medicine_alert_43/pages/main/login_page.dart';
import 'package:our_medicine_alert_43/pages/main/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Med",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
