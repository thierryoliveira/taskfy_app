import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/global/colors.dart';
import 'package:todo_app/app/modules/task/controllers/task_controller.dart';

class TaskItem extends GetWidget<TaskController> {
  final int index;
  final Task task;
  const TaskItem({this.task, this.index});
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    double taskPercentage =
        controller.getTaskPercentage(task.createdDate, task.dateTime);

    return Obx(() => ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Dismissible(
          key: UniqueKey(),
          secondaryBackground: swipeLeftBackground(),
          background: controller.filteredTasks[index].status == 'DONE'
              ? swipeRightDoneBackground()
              : swipeRightBackground(),
          confirmDismiss: (direction) async {
            if (controller.filteredTasks[index].status == 'DONE' ||
                direction == DismissDirection.endToStart) {
              controller.deleteTask(controller.filteredTasks[index].id);
              return true;
            } else {
              await controller.completeTask(task.id);
              await controller.getAll();
              return false;
            }
          },
          child: GestureDetector(
            // onTap: () {
            //   Get.defaultDialog(
            //     title: task.title.toUpperCase(),
            //     content: Container(
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //         border: Border(top: BorderSide(width: 2, color: kLighterColor))
            //       ),
            //       padding: EdgeInsets.only(top: size.height * 0.02),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.only(bottom: size.height * 0.03),
            //             child: Text(task.description),
            //           ),
            //           Container(
            //             margin: EdgeInsets.only(bottom: size.height * 0.03),
            //       decoration: BoxDecoration(
            //         border: Border(top: BorderSide(width: 2, color: kLighterColor))
            //       )),
            //           Text('Total time progress'),
            //           Padding(
            //             padding: EdgeInsets.only(top: size.height * 0.01, left: size.width * 0.15),
            //             child: LinearPercentIndicator(
            //                   width: 140.0,
            //                   lineHeight: 14.0,
            //                   percent: taskPercentage,
            //                   backgroundColor: Colors.grey,
            //                   progressColor: Colors.blue,
            //                 ),
            //           ),
            //                 Text((taskPercentage * 100).toStringAsFixed(1) + '%', style: TextStyle(fontWeight: FontWeight.bold),),
            //           Container(
            //             margin: EdgeInsets.only(top: size.height * 0.03, bottom: size.height * 0.03),
            //       decoration: BoxDecoration(
            //         border: Border(top: BorderSide(width: 2, color: kLighterColor))
            //       )),
            //                 Text('Created ' + controller.formatDateToShow(task.createdDate)),
            //                 Text('To finish  ' + controller.formatDateToShow(task.dateTime)),

            //         ],
            //       ),
            //     ),
            //   );
            // },
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(top: 7, bottom: 7),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.02),
                      child: controller.filteredTasks[index].status == 'DONE'
                          ? Icon(
                              Icons.check_circle,
                              color: kSuccessColor,
                            )
                          : Icon(
                              Icons.pending_actions,
                              color: kComplementaryColor,
                            ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      child: Text(
                        controller.filteredTasks[index].title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: controller.filteredTasks[index].status == 'DONE'
                            ? TextStyle(
                                color: Color(0xff656565),
                                fontSize: 22,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                color: Color(0xff656565),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  controller.formatDateToShow(task.dateTime),
                  // textAlign: TextAlign.center,
                  style: controller.filteredTasks[index].status == 'DONE'
                      ? TextStyle(
                          fontSize: 18, decoration: TextDecoration.lineThrough)
                      : TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        )));
  }

  Widget swipeRightBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: kMidBlueColor,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            Text(
              " Make done",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget swipeLeftBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: kRadicalRedColor,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget swipeRightDoneBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: kRadicalRedColor,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: Get.size.width * 0.04),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
