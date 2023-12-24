import 'package:flutter/material.dart';
import 'package:task_manager/Drawer.dart';
import 'package:task_manager/taskItem.dart';

import '../Task.dart';

class HomeScreen extends StatefulWidget {
  List<Task> tasks;
  List<Task> tasksDone;

  HomeScreen({
    super.key,
    required this.tasks,
    required this.tasksDone,
  });

  @override
  State<StatefulWidget> createState() =>
      _HomeScreen(tasks: this.tasks, tasksDone: this.tasksDone);
}

class _HomeScreen extends State<HomeScreen> {
  List<Task> tasks;
  List<Task> tasksDone;

  AddFromTasksDoneToTask(int id) {
    setState(() {
      Task t = Task(title: "BUG Add from tasksDone to Task", id: 0000);
      for (int index = 0; index < tasksDone.length; index++) {
        if (tasksDone[index].id == id) {
          t = tasksDone[index];
        }
      }
      t.isDone = false;
      tasksDone.removeWhere((element) => element.id == id);
      tasks.add(t);
      print("Tasks : ${tasks}, ---------- ${id}");
      print("Tasks Done : ${tasksDone} ---------- ${id}");
    });
  }

  DoneATask(int id) {
    setState(() {
      Task t = Task(title: "BUG Done a Task", id: 1111);
      for (int index = 0; index < tasks.length; index++) {
        if (tasks[index].id == id) {
          t = tasks[index];
        }
      }
      t.isDone = true;
      tasks.removeWhere((element) => element.id == id);
      tasksDone.add(t);
      print("Tasks : ${tasks}, ---------- ${id}");
      print("Tasks Done : ${tasksDone} ---------- ${id}");
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _HomeScreen({required this.tasks, required this.tasksDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenu(
        tasks: this.tasks,
        tasksDone: this.tasksDone,
        AddFromTasksDoneToTask: this.AddFromTasksDoneToTask,
        DoneATask: this.DoneATask,
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
            setState(() {
              _scaffoldKey.currentState?.openDrawer();
            });
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
                        id: tasks[index].id,
                        tasks: this.tasks,
                        tasksDone: this.tasksDone,
                        AddFromTasksDoneToTask: this.AddFromTasksDoneToTask,
                        DoneATask: this.DoneATask,
                      ))),
        ],
      ),
    );
  }
}
