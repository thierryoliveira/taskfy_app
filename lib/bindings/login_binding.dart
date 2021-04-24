import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/login_controller.dart';
import 'package:todo_app/data/providers/auth_api.dart';
import 'package:todo_app/data/repository/login_repository.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< LoginController>(() => LoginController());
  Get.lazyPut< LoginRepository>(() => LoginRepository());
  }
}