import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/modules/login/controllers/login_controller.dart';
import 'package:todo_app/app/global/colors.dart';

class LoginPage extends GetView<LoginController> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final BorderRadius radiusStyle = BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30));

    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(top: size.height * 0.1),
                height: size.height * 0.35,
                child: SvgPicture.asset('assets/signin.svg')),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(top: height * 0.01),
            //       child: Text('taskdown',
            //           style: GoogleFonts.lobsterTwo(
            //               fontSize: height * 0.1, color: Colors.white)),
            //     ),
            //     Container(
            //       padding: EdgeInsets.only(top: height * 0.03),
            //       child: Align(
            //         alignment: Alignment.center,
            //         child: FaIcon(
            //           FontAwesomeIcons.tasks,
            //           color: Colors.white,
            //           size: height * 0.1,
            //         ),
            //       ),
            //       height: size.height * 0.28,
            //     ),
            //   ],
            // ),
            Container(
              height: size.height * 0.55,
              decoration: BoxDecoration(
                  color: kLighterColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    alignment: Alignment.center,
                    child: Text(
                      'Good morning!',
                      style: TextStyle(fontSize: 24, color: kDarkBlueColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.03,
                        right: width * 0.03,
                        top: height * 0.03),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                        prefixIcon: Icon(Icons.mail),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kLightGreyColor, width: 1),
                          borderRadius: radiusStyle,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1),
                            borderRadius: radiusStyle),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.03,
                        right: width * 0.03,
                        top: height * 0.02),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kLightGreyColor, width: 1),
                            borderRadius: radiusStyle),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1),
                            borderRadius: radiusStyle),
                      ),
                    ),
                  ),
                  GetX<LoginController>(
                    initState: (_) {},
                    // init: LoginController(repository: LoginRepository(apiClient: ApiClient(dio: Dio()))),
                    builder: (_) {
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: width * 0.03,
                              right: width * 0.03,
                              top: height * 0.04),
                          height: 54,
                          width: width * 0.94,
                          child: ElevatedButton(
                            onPressed: () {
                              _.signIn(usernameController.text,
                                  passwordController.text);
                              if (_.signedIn) {
                                Get.toNamed('/tasks');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: _.color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: radiusStyle),
                            ),
                            child: _.loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ))
                                : Text(
                                    "sign in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                    // style: GoogleFonts.lobsterTwo(
                                    //     fontSize: 28,
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.bold)
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        width * 0.04, height * 0.03, width * 0.04, 0),
                    width: width,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 2,
                                color: kLightGreyColor.withOpacity(0.3)))),
                  ),
                  Container(
                      width: width,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: height * 0.03),
                      child: RichText(
                        text: TextSpan(
                            text: 'Do not have an account yet? ',
                            style: TextStyle(fontSize: 18, color: kDarkBlueColor),
                            children: [
                              TextSpan(
                                  text: 'Create now!',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('click')),
                            ]),
                      ))
                ],
              ),
            ),
            Container(
              height: height * 0.1,
              width: size.width,
              color: kPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: width * 0.03),
                    child: FaIcon(
                      FontAwesomeIcons.code,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: width * 0.03),
                    child: Text('developed by: Thierry Oliveira',
                        style: GoogleFonts.lobsterTwo(
                            fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
