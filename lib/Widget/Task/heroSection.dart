import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              "کارها را مدیریت کن",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 16),
            ),
          ),
          Text(
            "با App راکت کارهای شخصی خودت رو منظم کن و با مدیریت کامل به اون ها رسیدگی کن",
            style: TextStyle(color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}
