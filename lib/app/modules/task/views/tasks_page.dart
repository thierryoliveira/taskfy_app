import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
        topLeft: Radius.circular(65),);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add, size: 40,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        onPressed: () {  },

      ),
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
            color: kPrimaryColor,
            height: height * 0.28,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Today', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w500),),
                    Text('7 tasks', style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),                
                    onPressed: (){}, 
                    child: Text('Add new', style: TextStyle(color: kPrimaryColor, fontSize: 20),)
                    ),
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
              return _.taskList.length < 1 ? 
                Center(child: CircularProgressIndicator(),)
              : Container(
                  height: height * 0.72,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.03, height * 0.05, width * 0.03, height * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: radiusStyle,
                  ),
                  child: ListView.builder(
                    
                    itemBuilder: (context, index){
                      return TaskItem(task: _.taskList[index],);
                    },
                    itemCount: _.taskList.length,
                    )
                  );
            },
          ),
        ],
      ),
    );
  }
}