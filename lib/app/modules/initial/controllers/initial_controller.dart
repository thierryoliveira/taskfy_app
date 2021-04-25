import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:todo_app/app/routes/app_routes.dart';

class InitialController extends GetxController {

  String verifyAuthentication(){
    String token = getTokenFromStorage();
    if(token!= null && token.isNotEmpty){
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      int timestamp = decodedToken['exp'] * 1000;
      var expDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
      var currentDate = DateTime.now();
      if(!expDate.isBefore(currentDate)){
        return Routes.TASKS;
      }
    }
    return Routes.LOGIN;
  }

  String getTokenFromStorage() {
    return GetStorage().read('accessToken');
  }
}