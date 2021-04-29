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
        topLeft: Radius.circular(40), topRight: Radius.circular(40),);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add, size: 40,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        onPressed: () { 
          controller.signOut();
         },
      ),
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
                    onPressed: (){
                      Get.toNamed('/signup');
                    }, 
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
                  height: height * 0.75,
                  decoration: BoxDecoration(
                    color: kLighterColor,
                    borderRadius: radiusStyle,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => Divider(),
                    padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.05, size.width * 0.05, size.height * 0.05),
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
