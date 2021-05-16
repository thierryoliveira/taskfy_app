import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/global/colors.dart';
import 'package:todo_app/app/modules/task/controllers/task_controller.dart';

class TaskItem extends GetWidget<TaskController> {
  final int index;
  final Task task;
  const TaskItem({this.task, this.index});
  @override
  Widget build(BuildContext context) {

    print('task ' + task.title + ' status ' + task.status);

    print('filtered length: ' + controller.filteredTasks.length.toString());

    final size = Get.size;

    return Obx(() => Dismissible(
              key: UniqueKey(),
              secondaryBackground: swipeLeftBackground(),
              background: controller.filteredTasks[index].status == 'DONE' ? swipeRightDoneBackground() : swipeRightBackground(),
              confirmDismiss: (direction) async {
                if (controller.filteredTasks[index].status == 'DONE' || direction == DismissDirection.endToStart) {
                  controller.deleteTask(controller.filteredTasks[index].id);
                  controller.getAll();
                  return true;
                } else {
                  await controller.completeTask(task.id);
              await controller.getAll();
              return false;
            }
          },
          child: GestureDetector(
            onTap: (){
              Get.defaultDialog(

              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
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
                    Text(
                      controller.filteredTasks[index].title,
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
                  ],
                ),

                subtitle: Text(controller.filteredTasks[index].dateTime, style: controller.filteredTasks[index].status == 'DONE' ? TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough) : TextStyle(fontSize: 18),),
              ),
            ),
          ),
        ));
 
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
