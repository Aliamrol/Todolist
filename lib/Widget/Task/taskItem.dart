import 'package:flutter/material.dart';

class taskItem extends StatelessWidget {
  const taskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "کار فلان",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  "توضیحات کار فلان",
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
          ),
          Icon(
            Icons.delete,
            color: Colors.red[300],
            size: 20,
          )
        ],
      ),
    );
  }
}
