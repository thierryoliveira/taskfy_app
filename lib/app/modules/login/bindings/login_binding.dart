import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repository/login/login_repository.dart';
import 'package:todo_app/app/modules/login/controllers/login_controller.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< LoginController>(() => LoginController());
  Get.lazyPut< LoginRepository>(() => LoginRepository());
  }
}