import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Task.dart';

class TaskItem extends StatelessWidget {
  late String title;
  late bool isDone;
  late String? description;

  List<Task> tasks;
  List<Task> tasksDone;

  final Function AddFromTasksDoneToTask;

  TaskItem(
      {super.key,
      required this.title,
      required this.isDone,
      this.description,
      required this.tasks,
      required this.tasksDone,
      required this.AddFromTasksDoneToTask});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 70,
        margin: EdgeInsets.only(top: 7),
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    description ?? "no description",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: () {
                    
                  },
                  icon: isDone
                      ? Icon(Icons.task_alt)
                      : Icon(Icons.circle_outlined)),
            )
          ],
        ),
      ),
    );
  }
}
