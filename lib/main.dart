import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/bindings/login_binding.dart';
import 'package:todo_app/routes/app_pages.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/utils/colors.dart';

Future<void> main() async {
  runApp(MyApp());
   Future.wait([
    precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/splashscreen.svg'), null),
  ]);
  await GetStorage.init('mytasks');
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(      
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,      
      title: 'taskdown app',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        )
      ),
    );
  }
}
