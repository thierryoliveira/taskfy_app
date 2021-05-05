import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/app/data/model/task/dto/create_task_dto.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/data/model/task/task_status_model.dart';
import 'package:todo_app/app/data/repository/task/task_repository.dart';
import 'package:todo_app/app/global/colors.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    _storage = GetStorage();
    this._token = _storage.read('accessToken');
    fillStatusList();
    super.onInit();
  }

  GetStorage _storage;

  String _token;

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
    }
  }

  createTask(String title, String description) async {
    CreateTaskDTO dto = CreateTaskDTO();
    dto.title = title;
    dto.description = description;
    dto.dateTime = formatDateAndTime();
    var result = await repository.createTask(dto, this._token);

  if(result.title != null && result.title.isNotEmpty){
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
}
