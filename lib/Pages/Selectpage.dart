import 'package:chatbot/Models/enums.dart';
import 'package:chatbot/Pages/Homecard.dart';
import 'package:chatbot/auth/Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helper/Global.dart';


class selectpage extends StatelessWidget {
  selectpage({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(left: 1),child:
          IconButton(onPressed: (){
            Get.changeTheme(Get.isDarkMode?ThemeData.light():ThemeData.dark());
          }, icon: Icon(Icons.brightness_4,size: 30,color: Colors.blue,)),),
        title: Text(
          "Ai Selection",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
            icon: Icon(
              Icons.logout,
              size: 27,
            ),
            color: Colors.blue,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * 0.04, vertical: mq.height * .02),
        children: Aiselection.values
            .map((e) => Homecard(
                  aiselection: e,
                ))
            .toList(),
      ),
    );
  }
}
