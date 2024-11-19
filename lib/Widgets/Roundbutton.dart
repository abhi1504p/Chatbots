import 'package:flutter/material.dart';
class Roundbutton extends StatelessWidget {
   Roundbutton({super.key, required this.title});

   final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueAccent
      ),
      child: Center(child: Text(title,style: TextStyle(fontSize: 25),)),
    );
  }
}
