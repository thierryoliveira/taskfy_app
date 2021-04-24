import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/routes/app_routes.dart';

class InitialController extends GetxController {

  String verifyAuthentication(){
    String token = getTokenFromStorage();
    return (token != null && token.isNotEmpty) ? Routes.TASKS :  Routes.LOGIN;
  }

  String getTokenFromStorage() {
    return GetStorage().read('accessToken');
  }
}