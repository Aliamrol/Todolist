import 'package:flutter/material.dart';
import 'package:task_manager/Drawer.dart';
import 'package:task_manager/taskItem.dart';

import '../Task.dart';

class HomeScreen extends StatefulWidget {
  List<Task> tasks;
  List<Task> tasksDone;

  HomeScreen({super.key, required this.tasks, required this.tasksDone});

  @override
  State<StatefulWidget> createState() =>
      _HomeScreen(tasks: this.tasks, tasksDone: this.tasksDone);
}

class _HomeScreen extends State<HomeScreen> {
  List<Task> tasks;
  List<Task> tasksDone;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _HomeScreen({required this.tasks, required this.tasksDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenu(
        tasks: this.tasks,
        tasksDone: this.tasksDone,
      ),
      appBar: AppBar(
        title: const Text(
          "TO DO LIST",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.grey[400],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) => TaskItem(
                        title: tasks[index].title,
                        isDone: tasks[index].isDone,
                        description: tasks[index].description,
                        tasks: this.tasks,
                        tasksDone: this.tasksDone,
                      ))),
        ],
      ),
    );
  }
}
