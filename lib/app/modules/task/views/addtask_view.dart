import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/model/enums/task-status.enum.dart';
import 'package:todo_app/app/global/colors.dart';
import 'package:todo_app/app/modules/task/controllers/task_controller.dart';

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
      resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
                      child: Container(
                        height: height,
                        padding: EdgeInsets.only(top: height * 0.06),
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child: Text('Create a new task', style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),),
                      ),
                      Expanded(
                                              child: Container(
                          alignment: Alignment.centerRight,
                                    padding: EdgeInsets.zero,
                                    height: size.height * 0.1,
                                    child: SvgPicture.asset('assets/new_idea.svg')),
                      ),
                    ],
                  ),
                  Container(
                    height: size.height * 0.8,
                    margin: EdgeInsets.only(top: size.height * 0.00),
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
                                  minimumSize: Size(width * 0.43, 0),
                                    // minimumSize: Size(size.width * 0.23, 0),
                                    primary: controller.inProgressStatusColor,
                                    padding: EdgeInsets.all(20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                onPressed: () {
                                  controller
                                      .changeSelectedFilter(TaskStatus.IN_PROGRESS);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: width * 0.02),
                                      child: Text('In progress', style: TextStyle(fontSize: 18),),
                                    ),
                                    Icon(Icons.hourglass_empty),
                                  ],
                                ))),
                            // Obx(() => ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //         // minimumSize: Size(size.width * 0.23, 0),
                            //         primary: controller.inProgressStatusColor,
                            //         padding: EdgeInsets.all(20),
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.all(
                            //                 Radius.circular(20)))),
                            //     onPressed: () {
                            //       controller.changeSelectedFilter(
                            //           TaskStatus.IN_PROGRESS);
                            //     },
                            //     child: Icon(Icons.pending_actions))),
                            Obx(() => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(width * 0.43, 0),

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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: width * 0.02),
                                      child: Text('Done', style: TextStyle(fontSize: 18),),
                                    ),
                                    Icon(Icons.done),
                                  ],
                                ))),
                          ],
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                labelText: 'Title',
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
          ),
        );
  }

  List<DropdownMenuItem> returnDropdownItems() {
    List<DropdownMenuItem> items = <DropdownMenuItem>[];
    controller.statusList.forEach((status) =>
        items.add(DropdownMenuItem(child: Text(status.toString()))));
    return items;
  }
}
