import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app/data/repository/auth/auth_repository.dart';
import 'package:todo_app/app/global/colors.dart';

class AuthController extends GetxController {
  final repository = Get.find<AuthRepository>();

  final box = GetStorage();

  final _color = kPrimaryColor.obs;
  get color => this._color.value;
  set color(value) => this._color.value = value;

  final _loading = false.obs;
  get loading => this._loading.value;
  set loading(value) => this._loading.value = value;

  final _signedIn = false.obs;
  get signedIn => this._signedIn.value;
  set signedIn(value) => this._signedIn.value = value;

  signIn(String username, String password) {
    if ((username != null && username.isNotEmpty) &&
        (password != null && password.isNotEmpty)) {
      this.loading = true;
      changeButtonLoading();
      repository.signIn(username, password).then((data) {
        if (data.accessToken != null && data.accessToken.isNotEmpty) {
          writeAccessTokenOnStorage(data.accessToken);
          this.loading = false;
          this.signedIn = true;
          changeButtonLoading();
          Get.offAndToNamed('/tasks');
        } else {
          this.loading = false;
          changeButtonLoading();
  
          Get.snackbar(
            "Invalid credentials",
            "Please, check your username and password",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: kRadicalRedColor,
          );
        }
        // signedIn = data;
      });
    }
  }

  // signUp(String username, String password)

  writeAccessTokenOnStorage(String token) {
    box.write('accessToken', token);
  }

  changeButtonLoading() {
    this.color = this.loading ? kRadicalRedColor : kPrimaryColor;
  }
}
