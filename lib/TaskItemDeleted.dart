import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Task.dart';

class taskItemDeleted extends StatefulWidget {
  Task task;
  final Function deleteTask;
  final Function returnTask;

  taskItemDeleted(
      {required this.task, required this.deleteTask, required this.returnTask});

  @override
  State<StatefulWidget> createState() => _taskItemDeleted();
}

class _taskItemDeleted extends State<taskItemDeleted> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 70,
        margin: EdgeInsets.only(top: 7),
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 8),
                  child: Text(
                    widget.task.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    widget.task.description ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
            Row(  
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.returnTask(widget.task);
                        });
                      },
                      icon: Icon(CupertinoIcons.refresh_thin)),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.deleteTask(widget.task);
                          });
                        },
                        icon: Icon(
                          CupertinoIcons.delete_simple,
                          color: Colors.red,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
