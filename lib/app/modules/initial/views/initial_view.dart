import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:todo_app/app/modules/initial/controllers/initial_controller.dart';
import 'package:todo_app/app/global/colors.dart';

class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 3,
            gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kLighterColor,
                Color(0xff6C63FF),
              ]
            ),
            navigateAfterSeconds: controller.verifyAuthentication(),
            loaderColor: Colors.transparent,
          ),
          Align(
            alignment: Alignment.center,
                      child: SizedBox(            
              height: Get.size.height * 0.4,
              child: SvgPicture.asset('assets/splashscreen.svg'),
            ),
          )
        ],
      ),
    );
  }
}