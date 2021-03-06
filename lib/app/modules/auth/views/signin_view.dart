import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/global/colors.dart';
import 'package:todo_app/app/modules/auth/controllers/auth_controller.dart';

class SignInPage extends GetView<AuthController> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        resizeToAvoidBottomInset: true,
        backgroundColor: kPrimaryColor,
        body: SafeArea(
                  child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.only(top: size.height * 0.1),
                  height: size.height * 0.3,
                  child: SvgPicture.asset('assets/signin.svg')),
              Container(
                height: size.height * 0.61,
                decoration: BoxDecoration(
                    color: kLighterColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Form(
                  key: _formKey,
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
                        child: TextFormField(
                          validator: (value) => (value.isBlank || value.length < 3) ? "Username required" : null,
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                            prefixIcon: Icon(Icons.person),
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
                        child: Obx(() => TextFormField(
                          validator: (value) {
                            bool isValid = controller.validatePasswordStrength(value);
                            return isValid ? null : "Invalid password";
                          },
                              controller: passwordController,
                              obscureText: controller.obscureTextPasswordLogin,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () =>
                                        controller.changeObscureTextPasswordLogin(),
                                    icon: Icon(Icons.remove_red_eye)),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kLightGreyColor, width: 1),
                                    borderRadius: radiusStyle),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor, width: 1),
                                    borderRadius: radiusStyle),
                              ),
                            )),
                      ),
                      GetX<AuthController>(
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
                                  if(_formKey.currentState.validate())
                                    _.signIn(usernameController.text,
                                      passwordController.text);
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
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            width * 0.04, height * 0.05, width * 0.04, 0),
                        width: width,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 2,
                                    color: kLightGreyColor.withOpacity(0.3)))),
                      ),
                      Expanded(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: width,
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Do not have an account yet? ',
                                    style:
                                        TextStyle(fontSize: 18, color: kDarkBlueColor),
                                    children: [
                                      TextSpan(
                                          text: 'Create now!',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => Get.toNamed('/signup')),
                                    ]),
                              )),
                        ],
                      ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              Container(
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
          ),
        ));
  }
}
