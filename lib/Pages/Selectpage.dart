import 'package:chatbot/Models/enums.dart';
import 'package:chatbot/Pages/Homecard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Helper/Global.dart';

class selectpage extends StatelessWidget {
  selectpage({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        title: Text(
          "Ai Selection",
          style: TextStyle(
              color: Colors.blue, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: Icon(
              Icons.brightness_4,
              size: 27,
            ),
            color: Colors.blue,
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.symmetric(horizontal: mq.width*0.04,vertical: mq.height*.02),
        children:Aiselection.values.map((e)=>Homecard(aiselection: e,)).toList(),
      ),
    );
  }
}
