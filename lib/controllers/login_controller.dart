import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/colors.dart';

class LoginController extends GetxController {
  final _color = kPrimaryColor.obs;
  get color => this._color.value;
  set color(value) => this._color.value = value;

  final _loading = false.obs;
  get loading => this._loading.value;
  set loading(value) =>this._loading.value = value;

  changeButtonLoading()  {
    this.loading = true;
    debugPrint('changebutton was called');
    this.color = kRadicalRedColor;
     Future.delayed(const Duration(seconds: 5), () {
       this.color = kPrimaryColor;
       this.loading = false;
     });
  }

}