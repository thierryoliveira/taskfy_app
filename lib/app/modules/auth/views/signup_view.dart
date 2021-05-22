import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/global/colors.dart';
import 'package:todo_app/app/modules/auth/controllers/auth_controller.dart';

class SignUpPage extends GetView<AuthController> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final BorderRadius radiusStyle = BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: height * 0.24,
                      child: SvgPicture.asset('assets/add_user.svg')),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.03, bottom: height * 0.02),
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.6,
              decoration: BoxDecoration(
                  color: kLighterColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35))),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                       margin: EdgeInsets.only(
                          left: width * 0.05,
                          right: width * 0.05,),
                      child: TextFormField(
                        controller: usernameController,
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
                          right: width * 0.05,),
                      child: Obx(() => TextFormField(
                            validator: (value){
                              bool isValid = RegExp(r"^((?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{8,20})$").hasMatch(value);
                              return isValid ? null : 'Your password need to be strong';
                            },
                            obscureText: controller.obscureTextPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'password',
                              hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () =>
                                      controller.changeObscurePasswordValue(),
                                  icon: Icon(Icons.remove_red_eye)),
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
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: width * 0.05,
                          right: width * 0.05,),
                      child: Obx(() => TextFormField(
                        validator: (value) {
                          return value == passwordController.text ? null : "Password confirmation doesn't match";
                        },
                            obscureText:
                                controller.obscureTextPasswordConfirmation,
                            controller: passwordConfirmationController,
                            decoration: InputDecoration(
                              hintText: 'password confirmation',
                              hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () => controller
                                      .changeObscurePasswordConfirmationValue(),
                                  icon: Icon(Icons.remove_red_eye)),
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
                          )),
                    ),
                    Obx(() => Container(
                          margin: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,),
                          height: 54,
                          width: width * 0.94,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate())
                                  controller.signUp(
                                usernameController.text, passwordController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: controller.color,
                              shape: RoundedRectangleBorder(
                                borderRadius: radiusStyle,
                              ),
                            ),
                            child: controller.loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ))
                                : Text(
                                    "sign up",
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
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
