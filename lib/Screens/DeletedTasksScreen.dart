import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/TaskItemDeleted.dart';
import '../Task.dart';
import '../taskItem.dart';

class deletedTasksScreen extends StatefulWidget {
  late List<Task> deletedTasks;
  final Function deleteTaskSure;
  final Function returnTask;

  deletedTasksScreen(
      {super.key,
      required this.deletedTasks,
      required this.deleteTaskSure,
      required this.returnTask});

  @override
  State<StatefulWidget> createState() => _deletedTasksScreen();
}

class _deletedTasksScreen extends State<deletedTasksScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < widget.deletedTasks.length; i++) {
      rows.add(SizedBox(
        height: 20,
      ));
      rows.add(taskItemDeleted(
          task: widget.deletedTasks[i],
          deleteTask: widget.deleteTaskSure,
          returnTask: widget.returnTask));
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Deleted Tasks",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    Scaffold.of(context).openEndDrawer();
                  });
                },
                icon: Icon(
                  CupertinoIcons.delete,
                  color: Colors.black,
                )),
          )
        ],
        backgroundColor: Colors.grey[400],
      ),
      body: ListView(
        children: [
          ...rows,
        ],
      ),
    );
  }
}
