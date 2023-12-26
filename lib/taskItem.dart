import 'package:flutter/material.dart';
import 'package:task_manager/Screens/Editing%20TaskScreen.dart';
import 'package:task_manager/Screens/NewTaskScreen.dart';
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
  final Function editingTask;

  TaskItem(
      {super.key,
      required this.title,
      required this.isDone,
      this.description,
      required this.id,
      required this.tasks,
      required this.tasksDone,
      required this.AddFromTasksDoneToTask,
      required this.DoneATask,
      required this.editingTask});

  @override
  State<StatefulWidget> createState() => _TaskItem();
}

class _TaskItem extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => editinTaskScreen(
                      title: widget.title,
                      description: widget.description ?? "",
                      id: widget.id,
                      editingTask: widget.editingTask,
                    )));
      },
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
                    widget.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    widget.description ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isDone
                          ? widget.AddFromTasksDoneToTask(widget.id)
                          : widget.DoneATask(widget.id);
                    });
                  },
                  icon: widget.isDone
                      ? Icon(Icons.task_alt)
                      : Icon(Icons.circle_outlined)),
            )
          ],
        ),
      ),
    );
  }
}
