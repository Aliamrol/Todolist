import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/taskItem.dart';

import 'Task.dart';

class DrawerMenu extends StatefulWidget {
  List<Task> tasks;
  List<Task> tasksDone;
  final Function AddFromTasksDoneToTask;

  DrawerMenu({super.key, required this.tasks, required this.tasksDone, required this.AddFromTasksDoneToTask});

  @override
  State<StatefulWidget> createState() =>
      _DrawerMenu(tasks: this.tasks, tasksDone: this.tasksDone, AddFromTasksDoneToTask: this.AddFromTasksDoneToTask);
}

class _DrawerMenu extends State<DrawerMenu> {
  List<Task> tasks;
  List<Task> tasksDone;
  final Function AddFromTasksDoneToTask;

  _DrawerMenu({required this.tasks, required this.tasksDone, required this.AddFromTasksDoneToTask});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Expanded(
            child: ListView.builder(
                itemCount: tasksDone.length,
                itemBuilder: (BuildContext context, int index) => TaskItem(
                      title: tasksDone[index].title,
                      isDone: tasksDone[index].isDone,
                      description: tasksDone[index].description,
                      tasks: this.tasks,
                      tasksDone: this.tasksDone,
                      AddFromTasksDoneToTask: this.AddFromTasksDoneToTask,
                    ))));
  }
}
