import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/routes/app_pages.dart';
import 'package:todo_app/app/routes/app_routes.dart';
import 'package:todo_app/app/global/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  runApp(MyApp());
  Future.wait([
    precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoder, 'assets/splashscreen.svg'),
        null),
  ]);
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
          )),
    );
  }
}
