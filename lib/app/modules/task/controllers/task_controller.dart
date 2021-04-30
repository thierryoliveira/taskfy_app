import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/data/repository/task/task_repository.dart';

class TaskController extends GetxController {

  @override
  void onInit() {
    _storage = GetStorage();
    this._token = _storage.read('accessToken');
    super.onInit();
  }

  GetStorage _storage;
  
  String _token;

  final TaskRepository repository = TaskRepository();
    
  final _taskList = <Task>[].obs;
  get taskList => this._taskList;
  set taskList(value) =>this._taskList.value = value;

  signOut(){
    _storage.remove('accessToken');
    Get.offAndToNamed('/signin');
  }

  getAll() async {
    var tasks = await repository.getAll(this._token);
    if (tasks != null) {
      taskList.value = tasks;
    }
  }
}