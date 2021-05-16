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

  final _taskList = <Task>[].obs;
  get taskList => this._taskList;
  set taskList(value) => this._taskList.value = value;

  final _filteredTasks = <Task>[].obs;
  get filteredTasks => this._filteredTasks;
  set filteredTasks(value) => this._filteredTasks.value = value;

  final List<TaskStatus> statusList = <TaskStatus>[];

  final TaskRepository repository = TaskRepository();

  final _selectedDate = DateTime.now().obs;
  get selectedDate => this._selectedDate.value;
  set selectedDate(value) => this._selectedDate.value = value;

  final _selectedFilterStatus = TaskStatus.IN_PROGRESS.obs;
  get selectedFilterStatus => this._selectedFilterStatus.value;
  set selectedFilterStatus(value) => this._selectedFilterStatus.value = value;

  // final _openStatusColor = kPrimaryColor.obs;
  // get openStatusColor => this._openStatusColor.value;
  // set openStatusColor(value) => this._openStatusColor.value = value;

  final _inProgressStatusColor = kDarkBlueColor.obs;
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
    // this.filteredTasks = <Task>[];
    var tasks = await repository.getAll(this._token);
    if (tasks != null) {
      this.taskList = tasks;
      this.filteredTasks = tasks;
    }
  }

  deleteTask(int taskId) async {
    print(filteredTasks.length);
    filteredTasks.removeWhere((task) => task.id == taskId);
    var result = await repository.deleteTask(taskId, this._token);
    if (result.success){
      await getAll();
      Get.snackbar(
        "Success",
        "Task deleted",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: kSuccessColor,
      );
    }
    
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
      await getAll();
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
    dto.dateTime = this.selectedDate.toString();
    dto.createdDate = DateTime.now().toString();
    var result = await repository.createTask(dto, this._token);
    this.selectedDate = DateTime.now();
    this.selectedFilterStatus = TaskStatus.IN_PROGRESS;

    if (selectedFilterStatus == TaskStatus.DONE) completeTask(result.id);

    if (result.title != null && result.title.isNotEmpty) {
      getAll();
      Get.offAndToNamed('/tasks');
    }

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

  String formatDateToShow(String date) {
    DateTime parsedDate = DateTime.parse(date);
    DateFormat formatter = DateFormat('yyyy/MM/dd hh:mm');
    return formatter.format(parsedDate);
  }

  fillStatusList() {
    statusList.add(TaskStatus.OPEN);
    statusList.add(TaskStatus.IN_PROGRESS);
    statusList.add(TaskStatus.DONE);
  }

  changeSelectedFilter(TaskStatus status) {
    var isAlreadySelectedFilter = status == selectedFilterStatus;

    if (!isAlreadySelectedFilter) {
      switch (status) {
        case TaskStatus.OPEN:
          selectedFilterStatus = TaskStatus.OPEN;
          // openStatusColor = kDarkBlueColor;

          inProgressStatusColor = kPrimaryColor;
          doneStatusColor = kPrimaryColor;
          break;

        case TaskStatus.IN_PROGRESS:
          selectedFilterStatus = TaskStatus.IN_PROGRESS;
          inProgressStatusColor = kDarkBlueColor;

          // openStatusColor = kPrimaryColor;
          doneStatusColor = kPrimaryColor;
          break;

        case TaskStatus.DONE:
          selectedFilterStatus = TaskStatus.DONE;
          doneStatusColor = kDarkBlueColor;

          // openStatusColor = kPrimaryColor;
          inProgressStatusColor = kPrimaryColor;
          break;

        default:
          selectedFilterStatus = TaskStatus.ALL;
          // openStatusColor = kPrimaryColor;
          inProgressStatusColor = kPrimaryColor;
          doneStatusColor = kPrimaryColor;
          break;
      }
    } else {
      if (status == TaskStatus.DONE) {
        selectedFilterStatus = TaskStatus.IN_PROGRESS;
        inProgressStatusColor = kDarkBlueColor;
        doneStatusColor = kPrimaryColor;
      } else {
        selectedFilterStatus = TaskStatus.DONE;
        inProgressStatusColor = kPrimaryColor;
        doneStatusColor = kDarkBlueColor;
      }
    }
  }

  filterTasks(String text) {
    if (text.length >= 3) {
      this.filteredTasks = this.taskList.toList().where((task) {
        return task.title.contains(text) ? true : false;
      }).toList();
    } else
      this.filteredTasks = this.taskList;
  }

  getTaskPercentage(String taskDate, String taskCreatedDate) {
    var parsedTaskDate = DateTime.parse(taskDate);
    var parsedTaskCreatedDate = DateTime.parse(taskCreatedDate);

    var totalHours = parsedTaskDate.difference(parsedTaskCreatedDate).inHours;
    var elapsedHours = DateTime.now().difference(parsedTaskCreatedDate).inHours;

    double percentageDone = elapsedHours / totalHours;

    return percentageDone;
  }

  roundPercentage(double percentage) {
    var roundedPercentage = percentage.roundToDouble();
    print('rounding ' + percentage.toString() + ' to ' + roundedPercentage.toString());
    return roundedPercentage;
  }

}
