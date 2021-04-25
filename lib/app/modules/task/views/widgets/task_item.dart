import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/ui/task_model.dart';
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
      ),
      margin: EdgeInsets.only(
          bottom: size.height * 0.02,
          left: size.width * 0.05,
          right: size.width * 0.05),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [   
                  if(!isDone) Padding(
                    padding: EdgeInsets.only(right: size.width * 0.02),
                    child: Icon(Icons.check_circle, color: Colors.green,),
                  ),                  
                  Text(
                    widget.task.title,
                    style: isDone
                        ? TextStyle(
                            color: Color(0xff656565),
                            fontSize: 22,
                            decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold)
                        : TextStyle(color: Color(0xff656565), fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '4 pm',
                style: isDone
                    ? TextStyle(
                        color: Color(0xff656565),
                        fontSize: 22,
                        decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold)
                    : TextStyle(color: Color(0xff656565), fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ), // subtitle: Text(widget.task.description, style: widget.task.status == 'DONE' ? TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough) : TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
}
