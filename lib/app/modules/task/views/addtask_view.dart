import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/task_controller.dart';

class AddTaskPage extends GetView<TaskController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('AddTaskPage')),

    body: SafeArea(
      child: Text('AddTaskController'))
    );
  }
}