import 'package:flutter/material.dart';
import '../../Task.dart';
import '../../taskScreen.dart';

class addTaskbuttom extends StatelessWidget {
  final Function AddNewTaskToTasks;

  const addTaskbuttom({super.key, required this.AddNewTaskToTasks});

  void switchToCreatTaskScreen(context) async {
    Task? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TaskScreen()));
    if(result != null){
       AddNewTaskToTasks(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => switchToCreatTaskScreen(context),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.red[400], borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
