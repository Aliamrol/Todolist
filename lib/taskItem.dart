import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Task.dart';

class TaskItem extends StatefulWidget {
  late String title;
  late bool isDone;
  late String? description;
  late int id;

  List<Task> tasks;
  List<Task> tasksDone;

  final Function AddFromTasksDoneToTask;
  final Function DoneATask;

  TaskItem(
      {super.key,
      required this.title,
      required this.isDone,
      this.description,
      required this.id,
      required this.tasks,
      required this.tasksDone,
      required this.AddFromTasksDoneToTask,
      required this.DoneATask});

  @override
  State<StatefulWidget> createState() => _TaskItem(
      title: this.title,
      isDone: this.isDone,
      description: this.description,
      id: this.id,
      tasks: this.tasks,
      tasksDone: this.tasksDone,
      AddFromTasksDoneToTask: this.AddFromTasksDoneToTask,
      DoneATask: this.DoneATask);
}

class _TaskItem extends State<TaskItem> {
  late String title;
  late bool isDone;
  late String? description;
  late int id;

  List<Task> tasks;
  List<Task> tasksDone;

  final Function AddFromTasksDoneToTask;
  final Function DoneATask;

  _TaskItem(
      {required this.title,
      required this.isDone,
      this.description,
      required this.id,
      required this.tasks,
      required this.tasksDone,
      required this.AddFromTasksDoneToTask,
      required this.DoneATask});

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
                    id.toString(),
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
                    setState(() {
                      isDone ? AddFromTasksDoneToTask(id) : DoneATask(id);
                    });
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
