import 'package:flutter/material.dart';
import 'package:task_manager/WidgetTodo.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.grey[700],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "عنوان کار شما",
                              border: InputBorder.none),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  children: [
                    TodoWidget(title: "ثبت دامنه راکت", isdone: true),
                    TodoWidget(
                      title: "استخدام برنامه نویس",
                      isdone: false,
                    ),
                    TodoWidget(
                      title: "ساخت قالب راکت",
                      isdone: false,
                    ),
                  ],
                ))
              ],
            ),
          ),
        )));
  }
}
