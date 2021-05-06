import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/task_controller.dart';

class TaskBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< TaskController>(() => TaskController());
  }
}