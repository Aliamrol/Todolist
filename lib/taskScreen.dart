import 'package:flutter/cupertino.dart';

class taskScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => taskScreenState();
}

class taskScreenState extends State<taskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Text("Hello world!"),
      ),
    ));
  }
}
