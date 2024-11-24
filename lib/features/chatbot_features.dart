import 'package:chatbot/Controller/chat_Controller.dart';
import 'package:chatbot/Widgets/messageCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chatbot_features extends StatelessWidget {
  chatbot_features({super.key});
  final _c = chat_Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ai Chatbot"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: _c.text,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    isDense: true,
                    hintText: "Ask the Questions",
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
              )),
              SizedBox(
                width: 7,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 25,
                child: IconButton(
                    onPressed: _c.askQuestion,
                    icon: Icon(
                      Icons.rocket_launch_rounded,
                      color: Colors.white,
                      size: 30,
                    )),
              )
            ],
          ),
        ),
        body: Obx(() => ListView(
              children: _c.list.map((e) => messageCard(Message: e)).toList(),
            )));
  }
}
