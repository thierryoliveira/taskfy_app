import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/model/task/task_status_model.dart';
import 'package:todo_app/app/global/colors.dart';
import 'package:todo_app/app/modules/task/controllers/task_controller.dart';
import 'package:todo_app/app/modules/task/views/widgets/status_button_filter.dart';

class AddTaskPage extends GetView<TaskController> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    final height = size.height;
    final width = size.width;
    final BorderRadius radiusStyle = BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    );

    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: height * 0.05),
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Create a task',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: size.height * 0.8,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.04, height * 0.05, width * 0.04, height * 0.03),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kLighterColor,
                    borderRadius: radiusStyle,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // minimumSize: Size(size.width * 0.23, 0),
                                  primary: controller.openStatusColor,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              onPressed: () {
                                controller
                                    .changeSelectedFilter(TaskStatus.OPEN);
                              },
                              child: Icon(Icons.hourglass_empty))),
                          Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // minimumSize: Size(size.width * 0.23, 0),
                                  primary: controller.inProgressStatusColor,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              onPressed: () {
                                controller.changeSelectedFilter(
                                    TaskStatus.IN_PROGRESS);
                              },
                              child: Icon(Icons.pending_actions))),
                          Obx(() => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // minimumSize: Size(size.width * 0.2, 0),
                                  primary: controller.doneStatusColor,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              onPressed: () {
                                controller
                                    .changeSelectedFilter(TaskStatus.DONE);
                              },
                              child: Icon(Icons.done))),
                        ],
                      ),
                      Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: 'Title',
                              hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                              prefixIcon: Icon(Icons.segment),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kLightGreyColor, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1),
                                  borderRadius: radiusStyle),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: TextField(
                              controller: descriptionController,
                              maxLines: 2,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                                prefixIcon: Icon(Icons.subject_rounded),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kLightGreyColor, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kPrimaryColor, width: 1),
                                    borderRadius: radiusStyle),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.02),
                            child: Obx(() => ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(width * 0.92, 0),
                                        primary: kPrimaryColor,
                                        padding: EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                    onPressed: () {
                                      DatePicker.showDateTimePicker(context,
                                          minTime: DateTime.now()
                                              .subtract(Duration(days: 60)),
                                          maxTime: DateTime.now()
                                              .add(Duration(days: 60)),
                                          locale: LocaleType.en,
                                          onChanged: (date) {
                                        print(date);
                                        controller.changeSelectedDate(date);
                                      });
                                    },
                                    child: Text(
                                      controller.returnSelectedDateAndTime(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ))),
                          ),
                        ],
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 2,
                                    color: kLightGreyColor.withOpacity(0.3)))),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(width * 0.92, 0),
                              primary: kPrimaryColor,
                              padding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: () {
                            controller.createTask(titleController.text, descriptionController.text);
                          },
                          child: Text('Done',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  List<DropdownMenuItem> returnDropdownItems() {
    List<DropdownMenuItem> items = <DropdownMenuItem>[];
    controller.statusList.forEach((status) =>
        items.add(DropdownMenuItem(child: Text(status.toString()))));
    return items;
  }
}
