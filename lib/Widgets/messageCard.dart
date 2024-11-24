import 'package:flutter/material.dart';

import '../Helper/Global.dart';
import '../Models/message.dart';

class messageCard extends StatelessWidget {
  final message Message;
  const messageCard({super.key, required this.Message});

  @override
  Widget build(BuildContext context) {
    return Message.msgType==MessageType.bot?Row(
      children: [

        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image.asset(
            "assets/images/text.png",
            width: 30,
          ),
        ),

        Container(
            constraints: BoxConstraints(maxWidth: mq.width*0.6),
            margin: EdgeInsets.only(bottom: 2,left: 5),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
            ),
            child: Text(Message.msg,textAlign: TextAlign.center,)),
      ],
    ):Row( mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image.asset(
            "assets/images/user.png",
            width: 30,
          ),
        ),

        Container(
          constraints: BoxConstraints(maxWidth: mq.width*0.6),
            margin: EdgeInsets.only(bottom: 2,left: 5),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
            ),
            child: Text(Message.msg,textAlign: TextAlign.center,))
      ],
    );
  }
}
