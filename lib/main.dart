import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/bindings/login_binding.dart';
import 'package:todo_app/routes/app_pages.dart';
import 'package:todo_app/routes/app_routes.dart';
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
      debugShowCheckedModeBanner: false,
      initialBinding: LoginBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,      
      title: 'taskdown app',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
