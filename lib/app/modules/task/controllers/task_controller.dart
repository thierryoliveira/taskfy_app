import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/app/data/model/enums/task-status.enum.dart';
import 'package:todo_app/app/data/model/task/dto/create_task_dto.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/data/model/task/task_status_model.dart';
import 'package:todo_app/app/data/repository/task/task_repository.dart';
import 'package:todo_app/app/global/colors.dart';

class TaskController extends GetxController {
  @override
  Future<void> onInit() async {
    _storage = GetStorage();
    this._token = _storage.read('accessToken');
    fillStatusList();
    super.onInit();
  }

  GetStorage _storage;

  String _token;

  
  final _filteredTasks = <Task>[].obs;
  get filteredTasks => this._filteredTasks;
  set filteredTasks(value) => this._filteredTasks.value = value;
  

  bool isFiltering = false;

  final List<TaskStatus> statusList = <TaskStatus>[];

  final TaskRepository repository = TaskRepository();

  final _taskList = <Task>[].obs;
  get taskList => this._taskList;
  set taskList(value) => this._taskList.value = value;

  final _selectedDate = DateTime.now().obs;
  get selectedDate => this._selectedDate.value;
  set selectedDate(value) => this._selectedDate.value = value;

  final _selectedFilterStatus = TaskStatus.ALL.obs;
  get selectedFilterStatus => this._selectedFilterStatus.value;
  set selectedFilterStatus(value) => this._selectedFilterStatus.value = value;

  final _openStatusColor = kPrimaryColor.obs;
  get openStatusColor => this._openStatusColor.value;
  set openStatusColor(value) => this._openStatusColor.value = value;

  final _inProgressStatusColor = kPrimaryColor.obs;
  get inProgressStatusColor => this._inProgressStatusColor.value;
  set inProgressStatusColor(value) => this._inProgressStatusColor.value = value;

  final _doneStatusColor = kPrimaryColor.obs;
  get doneStatusColor => this._doneStatusColor.value;
  set doneStatusColor(value) => this._doneStatusColor.value = value;

  changeSelectedDate(DateTime date) => selectedDate = date;

  signOut() {
    _storage.remove('accessToken');
    Get.offAndToNamed('/signin');
  }

  getAll() async {
    var tasks = await repository.getAll(this._token);
    if (tasks != null) {
      taskList.value = tasks;
      filteredTasks.value = tasks;
    }
  }

  deleteTask(int taskId) async {
    var result = await repository.deleteTask(taskId, this._token);
    if (result.success)
      Get.snackbar(
        "Success",
        "Task deleted",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: kSuccessColor,
      );
    else
      Get.snackbar(
        "Error",
        result.message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: kRadicalRedColor,
      );
  }

  completeTask(int taskId) async {
    TaskStatusModel task = TaskStatusModel(taskId, TaskStatus.DONE);

    var result = await repository.updateTaskStatus(task, this._token);
    if (result.success) {
      Get.snackbar(
        "Well done!",
        "Task completed",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: kSuccessColor,
      );
    } else
      Get.snackbar(
        "Error",
        result.message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: kRadicalRedColor,
      );
  }

  createTask(String title, String description) async {
    CreateTaskDTO dto = CreateTaskDTO();
    dto.title = title;
    dto.description = description;
    dto.dateTime = formatDateAndTime();
    var result = await repository.createTask(dto, this._token);

    if(selectedFilterStatus == TaskStatus.DONE)
      completeTask(result.id);

    if (result.title != null && result.title.isNotEmpty) {
        getAll();
      Get.offAndToNamed('/tasks');
    }

    print(result);
  }

  String returnSelectedDate() {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String selectedDateFormatted = formatter.format(selectedDate);
    String currentDateFormatted = formatter.format(DateTime.now());
    return selectedDateFormatted == currentDateFormatted
        ? 'Today'
        : selectedDateFormatted;
  }

  String returnSelectedDateAndTime() {
    DateFormat formatter = DateFormat('yyyy/MM/dd - hh:mm');
    String selectedDateFormatted = formatter.format(selectedDate);
    String currentDateFormatted = formatter.format(DateTime.now());
    return selectedDateFormatted == currentDateFormatted
        ? 'Today'
        : selectedDateFormatted;
  }

  String formatDateAndTime() {
    DateFormat formatter = DateFormat('yyyy/MM/dd - hh:mm');
    String selectedDateFormatted = formatter.format(selectedDate);
    return selectedDateFormatted;
  }

  fillStatusList() {
    statusList.add(TaskStatus.OPEN);
    statusList.add(TaskStatus.IN_PROGRESS);
    statusList.add(TaskStatus.DONE);
  }

  bool checkAlreadySelectedFilter(TaskStatus status) {
    bool response = false;
    if (status == selectedFilterStatus) {
      selectedFilterStatus = TaskStatus.ALL;
      openStatusColor = kPrimaryColor;
      inProgressStatusColor = kPrimaryColor;
      doneStatusColor = kPrimaryColor;
      response = true;
    }
    return response;
  }

  changeSelectedFilter(TaskStatus status) {
    var isAlreadySelectedFilter = checkAlreadySelectedFilter(status);

    if (!isAlreadySelectedFilter) {
      switch (status) {
        case TaskStatus.OPEN:
          selectedFilterStatus = TaskStatus.OPEN;
          openStatusColor = kDarkBlueColor;

          inProgressStatusColor = kPrimaryColor;
          doneStatusColor = kPrimaryColor;
          break;

        case TaskStatus.IN_PROGRESS:
          selectedFilterStatus = TaskStatus.IN_PROGRESS;
          inProgressStatusColor = kDarkBlueColor;

          openStatusColor = kPrimaryColor;
          doneStatusColor = kPrimaryColor;
          break;

        case TaskStatus.DONE:
          selectedFilterStatus = TaskStatus.DONE;
          doneStatusColor = kDarkBlueColor;

          openStatusColor = kPrimaryColor;
          inProgressStatusColor = kPrimaryColor;
          break;

        default:
          selectedFilterStatus = TaskStatus.ALL;
          openStatusColor = kPrimaryColor;
          inProgressStatusColor = kPrimaryColor;
          doneStatusColor = kPrimaryColor;
          break;
      }
    }
  }

  filterTasks(String text) {
    if(text.length >= 3){
      this.filteredTasks = this.taskList.where((task) => task.title.toLowerCase().contains(text.toLowerCase()) || task.description.toLowerCase().contains(text.toLowerCase())).toList();
      isFiltering = true;
    } else if (this.filteredTasks.length != this.taskList.length) {
      removeTaskFilters();
    }
  }

  removeTaskFilters() {
    this.filteredTasks = this.taskList;
  }

  bool checkIfTaskIsDone(int taskIndex) {
    return this.taskList[taskIndex].status == 'DONE';
  }
}
