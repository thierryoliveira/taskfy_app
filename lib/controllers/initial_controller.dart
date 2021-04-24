import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/routes/app_routes.dart';

class InitialController extends GetxController {

  final _storage = GetStorage('mytasks');

  RxString _text = ''.obs;
  get text => this._text.value;
  set text(value) => this.text.value = value;


  String verifyAuthentication(){
    // checking if is signed in
    
    String accessToken = _storage.read('accessToken');
    return (accessToken != null && accessToken.isNotEmpty) ? Routes.TASKS :  Routes.LOGIN;
  }
}