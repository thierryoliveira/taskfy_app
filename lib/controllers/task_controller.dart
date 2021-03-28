import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/data/repository/task_repository.dart';

class TaskController extends GetxController {

final TaskRepository repository;
TaskController({@required this.repository}) : assert(repository != null);

  final _taskList = <TaskModel>[].obs;
  get taskList => this._taskList;
  set taskList(value) =>this._taskList.value = value;


  getAll() {
    this.taskList = repository.getAll().then((data) {
      this.taskList = data;
    });
  }
}