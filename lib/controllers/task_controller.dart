import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/data/repository/task_repository.dart';

class TaskController extends GetxController {

  @override
  void onInit() {
    final storage = GetStorage('mytasks');
    this._token = storage.read('accessToken');
    super.onInit();
  }
  
  String _token;

  final TaskRepository repository = TaskRepository();
    
  final _taskList = <Task>[].obs;
  get taskList => this._taskList;
  set taskList(value) =>this._taskList.value = value;


  getAll() async {
    var tasks = await repository.getAll(this._token);
    if (tasks != null) {
      taskList.value = tasks;
    }
  }
}