import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/data/providers/api.dart';
import 'package:todo_app/data/repository/task_repository.dart';

class TaskBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< TaskController>(() => TaskController(
    repository: TaskRepository(apiClient: ApiClient(dio: Dio()))));
  }
}