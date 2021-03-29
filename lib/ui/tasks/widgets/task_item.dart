import 'package:flutter/material.dart';
import 'package:todo_app/data/model/task_model.dart';
import 'package:todo_app/utils/colors.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({Key key, this.title, this.description}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
  final String title;
  final String description;
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(           
       shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(13.0),
  ), 
      margin: EdgeInsets.only(bottom: size.height * 0.035, left: size.width * 0.05, right: size.width * 0.05),      
      color: kLighterColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 7, bottom: 7),
        child: CheckboxListTile(           
           shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
          activeColor: kPrimaryColor,
          title: Text(widget.title, style: TextStyle(color: Color(0xff656565), fontSize: 20),),
          subtitle: Text(widget.description),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (_){

          }, value: true,
        ),
      ),
    );
  }
}