import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/model/task/task_model.dart';
import 'package:todo_app/app/global/colors.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({Key key, this.task}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
  final Task task;
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final bool isDone = widget.task.status == 'DONE';
    final size = Get.size;
    return Dismissible(
      key: ValueKey(widget.task.id),
      secondaryBackground: swipeLeftBackground(),
      background: !isDone ? swipeRightDoneBackground() : swipeRightBackground(), 
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!isDone)
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.02),
                      child: Icon(
                        Icons.check_circle,
                        color: kSuccessColor,
                      ),
                    ),
                  Text(
                    widget.task.title,
                    style: isDone
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
              Text(
                '4 pm',
                style: isDone
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
          ), // subtitle: Text(widget.task.description, style: widget.task.status == 'DONE' ? TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough) : TextStyle(fontSize: 18),),
        ),
      ),
    );
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
