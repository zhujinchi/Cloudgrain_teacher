import 'package:flutter/material.dart';
import 'package:Cloudgrain_teacher/screens/login/splash_screen.dart';
import 'package:Cloudgrain_teacher/screens/bottom_teacher_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: SplashPage(),
    );
  }
}