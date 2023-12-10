import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget icon = const IconEmpty();

class IconEmpty extends StatefulWidget {
  const IconEmpty({super.key});

  @override
  State<StatefulWidget> createState() => _IconEmpty();
}
class _IconEmpty extends State<IconEmpty> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            icon = IconFull();
          });
        },
        icon: const Icon(Icons.check_box_outline_blank));
  }
}

class IconFull extends StatefulWidget {
  const IconFull({super.key});

  @override
  State<StatefulWidget> createState() => _IconFull();
}

class _IconFull extends State<IconFull> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            icon = IconEmpty();
          });
        },
        icon: Icon(Icons.check_box));
  }
}

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
                        fontSize: 24),
                  ),
                ))
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                Row(
                  children: [
                    // Container(
                    //   height: 20,
                    //   width: 20,
                    //   decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    // ),
                    IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: icon,
                      padding: EdgeInsets.only(left: 10, right: 30),
                    ),
                    Text(
                      "Task 1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    )
                  ],
                ),
                Text("Task 2")
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
