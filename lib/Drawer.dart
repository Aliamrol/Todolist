import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/taskItem.dart';

import 'Task.dart';

class DrawerMenu extends StatefulWidget {
  List<Task> tasks;
  List<Task> tasksDone;

  final Function AddFromTasksDoneToTask;
  final Function DoneATask;
  final Function editingTask;

  DrawerMenu(
      {super.key,
      required this.tasks,
      required this.tasksDone,
      required this.AddFromTasksDoneToTask,
      required this.DoneATask,
      required this.editingTask});

  @override
  State<StatefulWidget> createState() => _DrawerMenu();
}

class _DrawerMenu extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Expanded(
            child: ListView.builder(
                itemCount: widget.tasksDone.length,
                itemBuilder: (BuildContext context, int index) => TaskItem(
                      title: widget.tasksDone[index].title,
                      isDone: widget.tasksDone[index].isDone,
                      description: widget.tasksDone[index].description,
                      id: widget.tasksDone[index].id,
                      tasks: widget.tasks,
                      tasksDone: widget.tasksDone,
                      AddFromTasksDoneToTask: widget.AddFromTasksDoneToTask,
                      DoneATask: widget.DoneATask,
                      editingTask: widget.editingTask,
                    ))));
  }
}
