import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/ui/login/login_screen.dart';
import 'package:todo_app/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'taskdown app',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
