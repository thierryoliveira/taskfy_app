import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
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

  final _selectedDate = DateTime.now().obs;
  get selectedDate => this._selectedDate.value;
  set selectedDate(value) => this._selectedDate.value = value;

  changeSelectedDate(DateTime date) => selectedDate = date;

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

  String returnSelectedDate(){
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String selectedDateFormatted = formatter.format(selectedDate);
      String currentDateFormatted = formatter.format(DateTime.now());
      return selectedDateFormatted == currentDateFormatted ? 'Today' : selectedDateFormatted;

  }
}