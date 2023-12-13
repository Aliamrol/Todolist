import 'package:flutter/material.dart';
import 'package:task_manager/Widget/Task/addTaskButtom.dart';
import 'package:task_manager/Widget/Task/heroSection.dart';
import 'package:task_manager/Widget/Task/taskItem.dart';
import 'taskScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          taskItem(),
                    )),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  child: addTaskbuttom(),
                )
              ],
            ),
          )),
        ));
  }
}
