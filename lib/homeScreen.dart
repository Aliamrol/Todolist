import 'package:flutter/material.dart';
import 'package:task_manager/Widget/Task/addTaskButtom.dart';
import 'package:task_manager/Widget/Task/heroSection.dart';
import 'package:task_manager/Widget/Task/taskItem.dart';
import 'Task.dart';
import 'taskScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(title: "ساخت راکت"),
    Task(title: "ساخت ویدیو یوتیوب")
  ];

  void AddNewTaskToTasks(Task t) {
    setState(() {
      tasks.add(t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          width: 40,
                          height: 40,
                          image: AssetImage("assets/images/logo.jpg"),
                        ),
                        Icon(Icons.menu, size: 28)
                      ],
                    ),
                    HeroSection(),
                    Expanded(
                        child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) =>
                          taskItem(
                              context: context,
                              index: index,
                              task: tasks[index]),
                    )),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  child: addTaskbuttom(AddNewTaskToTasks: AddNewTaskToTasks,),
                )
              ],
            ),
          )),
        ));
  }
}
