import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/data/repository/task_repository.dart';

class TaskController extends GetxController {

  final TaskRepository repository = TaskRepository();

  final _token = ''.obs;
  get token => this._token.value;
  set token(value) => this._token.value = value;
  
  final _taskList = <Task>[].obs;
  get taskList => this._taskList;
  set taskList(value) =>this._taskList.value = value;


  getAll(String token) async {
    var tasks = await repository.getAll(token);
    if (tasks != null) {
      taskList.value = tasks;
    }
  }
}