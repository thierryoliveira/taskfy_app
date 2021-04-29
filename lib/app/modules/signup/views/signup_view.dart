import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/global/colors.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final BorderRadius radiusStyle = BorderRadius.only(
        topLeft: Radius.circular(40), topRight: Radius.circular(40),);

  @override
  Widget build(BuildContext context) {
    bool isloading = false;
    final size = Get.size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          Container(
            height: height * 0.4,
            color: kPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: height * 0.24,
                    child: SvgPicture.asset('assets/add_user.svg')
                    ),
                    Padding(
                  padding: EdgeInsets.only(top: height * 0.03, bottom: height * 0.02),
                  child: Text('Create an account', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.5,
            decoration: BoxDecoration(
              color: kLighterColor,
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [                
                Container(
                    margin: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                        top: height * 0.05),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'username',
                        hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                        prefixIcon: Icon(Icons.person),
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
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                        top: height * 0.02),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kLightGreyColor, width: 1),
                            ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                        top: height * 0.02),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'password confirmation',
                        hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kLightGreyColor, width: 1),
                            ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1)),
                      ),
                    ),
                  ),
                  Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: height * 0.02),
                          height: 54,
                          width: width * 0.94,
                          child: ElevatedButton(
                            onPressed: (){                            
                            },
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40),)),
                            ),
                            child: isloading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ))
                                : Text("sign up", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                                    // style: GoogleFonts.lobsterTwo(
                                    //     fontSize: 28,
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.bold)
                                    ),
                          ),
                        ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
