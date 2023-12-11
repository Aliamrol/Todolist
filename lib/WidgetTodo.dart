import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  String title;
  bool isdone;

  TodoWidget({required this.title, required this.isdone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            child: isdone
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  )
                : null,
            width: 20,
            height: 20,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: isdone ? Colors.red[300] : Colors.grey[400],
                borderRadius: BorderRadius.circular(5)),
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isdone ? Colors.red[300] : Colors.grey[800],
                decoration:
                    isdone ? TextDecoration.lineThrough : TextDecoration.none),
          )
        ],
      ),
    );
  }
}
