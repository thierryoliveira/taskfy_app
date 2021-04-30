import 'package:get/get.dart';
import 'package:todo_app/app/data/repository/auth/auth_repository.dart';
import 'package:todo_app/app/modules/auth/controllers/auth_controller.dart';

class AuthBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< AuthController>(() => AuthController());
  Get.lazyPut< AuthRepository>(() => AuthRepository());
  }
}