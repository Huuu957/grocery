import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
import 'screens/loader.dart';

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
      home: Onbording(),
    );
  }
}
