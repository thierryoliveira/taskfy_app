import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/repository/login_repository.dart';
import 'package:todo_app/utils/colors.dart';

class LoginController extends GetxController {
  final LoginRepository repository;
  LoginController({@required this.repository}) : assert(repository != null);

  final _color = kPrimaryColor.obs;
  get color => this._color.value;
  set color(value) => this._color.value = value;

  final _loading = false.obs;
  get loading => this._loading.value;
  set loading(value) => this._loading.value = value;

  final _signedIn = false.obs;
  get signedIn => this._signedIn.value;
  set signedIn(value) => this._signedIn.value = value;

  final _token = ''.obs;
  get token => this._token.value;
  set token(value) => this._token.value = value;

  signIn(String username, String password) {
    if ((username != null && username.isNotEmpty) &&
        (password != null && password.isNotEmpty)) {
      this.loading = true;
      changeButtonLoading();
      repository.signIn(username, password).then((data) {
        if (data.accessToken != null && data.accessToken.isNotEmpty) {
          this.loading = false;
          this.signedIn = true;
          this.token = data.accessToken;
          saveTokenOnSecureStorage(this.token);
          changeButtonLoading();
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

  saveTokenOnSecureStorage(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'jwt', value: token);
  }

  changeButtonLoading() {
    this.color = this.loading ? kRadicalRedColor : kPrimaryColor;
  }
}
