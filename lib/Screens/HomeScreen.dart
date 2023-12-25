import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Drawer.dart';
import 'package:task_manager/floatingPoint.dart';
import 'package:task_manager/taskItem.dart';
import '../Task.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Task> tasks = [
    Task(
      title: "Mina",
      id: 930,
    ),
  ];
  List<Task> tasksDone = [
    Task(title: "Ali", id: 905, isDone: true),
  ];

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
    });
  }

  DoneATask(int id) {
    print("id is ---------------- ${id}");
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
    });
  }

  AddNewTask(Task task) {
    tasks.add(task);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < tasks.length; i++) {
      rows.add(SizedBox(
        height: 20,
      ));
      rows.add(TaskItem(
        title: tasks[i].title,
        isDone: tasks[i].isDone,
        description: tasks[i].description,
        id: tasks[i].id,
        tasks: this.tasks,
        tasksDone: this.tasksDone,
        AddFromTasksDoneToTask: this.AddFromTasksDoneToTask,
        DoneATask: this.DoneATask,
      ));
    }

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
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            setState(() {
              _scaffoldKey.currentState?.openDrawer();
            });
          },
        ),
      ),
      body: ListView(
        children: [
          ...rows,
        ],
      ),
      floatingActionButton: floatingPoint(AddNewTask: AddNewTask),
    );
  }
}
