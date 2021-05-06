import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusButtonFilter extends GetWidget {

  final Color color;
  final String text;
  final VoidCallback onPress;

  StatusButtonFilter({this.color, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {

    final size = Get.size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(size.width * 0.23, 0),
            primary: color,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        onPressed: onPress,
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)));
  }
}