import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
