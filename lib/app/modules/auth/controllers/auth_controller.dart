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

  final _obscureTextPasswordLogin = true.obs;
  get obscureTextPasswordLogin => this._obscureTextPasswordLogin.value;
  set obscureTextPasswordLogin(value) => this._obscureTextPasswordLogin.value = value;
  changeObscureTextPasswordLogin() => obscureTextPasswordLogin = !obscureTextPasswordLogin;


  final _obscureTextPassword = true.obs;
  get obscureTextPassword => this._obscureTextPassword.value;
  set obscureTextPassword(value) => this._obscureTextPassword.value = value;
  changeObscurePasswordValue() => obscureTextPassword = !obscureTextPassword;


  final _obscureTextPasswordConfirmation = true.obs;
  get obscureTextPasswordConfirmation => this._obscureTextPasswordConfirmation.value;
  set obscureTextPasswordConfirmation(value) => this._obscureTextPasswordConfirmation.value = value;
  changeObscurePasswordConfirmationValue() => obscureTextPasswordConfirmation = !obscureTextPasswordConfirmation;


  final _signedIn = false.obs;
  get signedIn => this._signedIn.value;
  set signedIn(value) => this._signedIn.value = value;

  signIn(String username, String password) {
    if ((username != null && username.isNotEmpty) &&
        (password != null && password.isNotEmpty)) {
      this.loading = true;
      changeButtonLoading();
      repository.signIn(username, password).then((result) {
        this.loading = false;
          changeButtonLoading();
        if (result.success) {
          writeAccessTokenOnStorage(result.data.accessToken);
          this.signedIn = true;
          Get.offAndToNamed('/tasks');
        } else {
          Get.snackbar(
            "Error",
            result.message,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: kRadicalRedColor,
          );
        }
        // signedIn = data;
      });
    }
  }

  signUp(String username, String password) {
    if ((username != null && username.isNotEmpty) &&
        (password != null && password.isNotEmpty)) {
          this.loading = true;
          changeButtonLoading();
          repository.signUp(username, password).then((result){
            this.loading = false;
          changeButtonLoading();
            if (result.success) {
              signIn(username, password);
            } else {
              Get.snackbar(
            "Error",
            result.message,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: kRadicalRedColor,
          );
            }
          });
        }
  }

  writeAccessTokenOnStorage(String token) {
    box.write('accessToken', token);
  }

  changeButtonLoading() {
    this.color = this.loading ? kRadicalRedColor : kPrimaryColor;
  }
}
