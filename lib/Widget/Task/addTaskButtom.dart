import 'package:flutter/material.dart';
import '../../taskScreen.dart';

class addTaskbuttom extends StatelessWidget {
  const addTaskbuttom({super.key});

  void switchToCreatTaskScreen(context) async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TaskScreen(title: "Ali Amrol",)));
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => switchToCreatTaskScreen(context),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.red[400], borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
