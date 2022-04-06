import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:our_medicine_alert_43/pages/main/splash.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var initializationSettingsAndroid = AndroidInitializationSettings('codex_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission :true,
    // onDidReceiveLocalNotification:(int id) async {};
  );

  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid
      , iOS: initializationSettingsIOS
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onSelectNotification: (payload) async {
      if(payload != null){
        debugPrint('notification payload: ' + payload);
      }
    },
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Med",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Splash(),
    );
  }
}
