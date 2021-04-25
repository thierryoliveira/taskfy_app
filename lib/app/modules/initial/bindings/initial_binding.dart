import 'package:get/get.dart';
import 'package:todo_app/app/modules/initial/controllers/initial_controller.dart';

class InitialBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< InitialController>(() => InitialController());
  }
}  