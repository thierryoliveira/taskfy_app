import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/task/controllers/task_controller.dart';
import 'package:todo_app/app/modules/task/views/widgets/task_item.dart';
import 'package:todo_app/app/global/colors.dart';

class TasksPage extends GetWidget<TaskController> {
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    final height = size.height;
    final width = size.width;
    final BorderRadius radiusStyle = BorderRadius.only(
      topLeft: Radius.circular(40),
      topRight: Radius.circular(40),
    );

    return Scaffold(
      floatingActionButton: Obx(() => FloatingActionButton(
            backgroundColor:
                controller.taskList.length > 0 ? kPrimaryColor : kLighterColor,
            child: Icon(
              Icons.add,
              size: 40,
              color: controller.taskList.length > 0
                  ? kLighterColor
                  : kPrimaryColor,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            onPressed: () {
              Get.toNamed('/addtask');
            },
          )),
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
            color: kPrimaryColor,
            height: height * 0.25,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.58,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'search',
                      hintStyle: TextStyle(color: Color(0xffa0a0a0)),
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kLightGreyColor, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kPrimaryColor, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                // Obx(() => Text(
                //       controller.taskList.length > 0
                //           ? "${controller.taskList.length} tasks remaining"
                //           : "No pending tasks",
                //       style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                //     )),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kDarkBlueColor,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      onPressed: () {
                                             },
                      child: Text(
                        // controller.returnSelectedDate(),
                        'add new',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ),
          GetX<TaskController>(
            init: TaskController(),
            initState: (_) {
              Get.find<TaskController>().getAll();
            },
            builder: (_) {
              print(_.taskList.length);
              return _.taskList.length < 1
                  ? Container(
                      margin: EdgeInsets.only(top: height * 0.08),
                      alignment: Alignment.center,
                      width: width * 0.7,
                      child: Column(
                        children: [
                          Text(
                            "No worries, there aren't tasks to do",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                              padding: EdgeInsets.only(top: size.height * 0.1),
                              height: size.height * 0.35,
                              child: SvgPicture.asset('assets/relax.svg')),
                        ],
                      ))
                  : Container(
                      height: height * 0.75,
                      decoration: BoxDecoration(
                        color: kLighterColor,
                        borderRadius: radiusStyle,
                      ),
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.05,
                            size.height * 0.05,
                            size.width * 0.05,
                            size.height * 0.05),
                        itemBuilder: (context, index) {
                          return TaskItem(
                            task: _.taskList[index],
                          );
                        },
                        itemCount: _.taskList.length,
                      ));
            },
          ),
        ],
      ),
    );
  }
}
