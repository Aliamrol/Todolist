import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class taskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => taskScreenState();
}

class taskScreenState extends State<taskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.grey[700],
                    size: 30,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Subject Task"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 24
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
