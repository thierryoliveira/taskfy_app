import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final BorderRadius radiusStyle = BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30));

    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Text('taskdown', style: GoogleFonts.lobsterTwo(fontSize: height * 0.1, color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.only(top: height * 0.03),
                  child: Align(
                    alignment: Alignment.center,
                    child: FaIcon(FontAwesomeIcons.tasks, color: Colors.white, size: height * 0.1,),
                  ),
                  height: size.height * 0.28,
                ),
              ],
            ),
            Container(
              height: size.height * 0.78,
              decoration: BoxDecoration(
                  color: kLighterColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: height * 0.1),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                          prefixIcon: Icon(Icons.mail),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kLightGreyColor, width: 1),
                              borderRadius: radiusStyle,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kPrimaryColor, width: 1),
                              borderRadius: radiusStyle
                          ),
                        ),
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: height * 0.02),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                            prefixIcon: Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kLightGreyColor, width: 1),
                                   borderRadius: radiusStyle
                              ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1),
                                borderRadius: radiusStyle
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03, top: height * 0.04),
                        height:  54,
                        width: size.width * 0.94,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: radiusStyle),
                          ),
                          child: Text("LOGIN", style: TextStyle(fontSize: 24),),
                        ),
                      ),
                  ],
              ),
            ),
          ],
        ));
  }
}
