import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/loader_screen.dart';
import 'screens/location_access_screen.dart';
import 'screens/notification_access_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        fontFamily: 'Cairo',
      ),
      home: SignUpScreen(),
    );
  }
}
