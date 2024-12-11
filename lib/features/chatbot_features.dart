import 'package:chatbot/Controller/chat_Controller.dart';
import 'package:chatbot/Widgets/messageCard.dart';
import 'package:chatbot/api/apis.dart';
import 'package:chatbot/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helper/Global.dart';

class chatbot_features extends StatelessWidget {
  chatbot_features({super.key});
  final _c = chat_Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ai Chatbot"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: _c.text,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration:  InputDecoration(
                  fillColor:Theme.of(context).scaffoldBackgroundColor,
                    filled: true,
                    isDense: true,
                    hintText: "Ask the Questions",
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
              )),
              const SizedBox(
                width: 7,
              ),
              CircleAvatar(
                backgroundColor:Theme.of(context).buttoncolor,
                radius: 25,
                child: IconButton(
                    onPressed: _c.askQuestion,
                    icon: const Icon(
                      Icons.rocket_launch_rounded,
                      color: Colors.white,
                      size: 30,
                    )),
              )
            ],
          ),
        ),
        body: Obx(() => ListView(physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: mq.height*0.02,bottom: mq.height*0.1),
              children: _c.list.map((e) => messageCard(Message: e)).toList(),
            )));
  }
}
