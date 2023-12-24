import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/taskItem.dart';

import 'Task.dart';

class DrawerMenu extends StatefulWidget {
  List<Task> tasks;
  List<Task> tasksDone;

  DrawerMenu({super.key, required this.tasks, required this.tasksDone});

  @override
  State<StatefulWidget> createState() =>
      _DrawerMenu(tasks: this.tasks, tasksDone: this.tasksDone);
}

class _DrawerMenu extends State<DrawerMenu> {
  List<Task> tasks;
  List<Task> tasksDone;

  _DrawerMenu({required this.tasks, required this.tasksDone});

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
                    ))));
  }
}
