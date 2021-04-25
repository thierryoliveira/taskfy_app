import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/ui/task_model.dart';
import 'package:todo_app/app/data/repository/task/task_repository.dart';

class TaskController extends GetxController {

  @override
  void onInit() {
    final storage = GetStorage();
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