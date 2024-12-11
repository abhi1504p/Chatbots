import 'package:chatbot/features/chatbot_features.dart';
import 'package:chatbot/main.dart';
import 'package:flutter/material.dart';

import '../Helper/Global.dart';
import '../Models/message.dart';

class messageCard extends StatelessWidget {
  final message Message;
  const messageCard({super.key, required this.Message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
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
            margin: EdgeInsets.only(bottom:mq.height*0.02,left: mq.width*0.02),
            padding: EdgeInsets.symmetric(horizontal: mq.width*0.02, vertical: mq.height*0.01),
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.only(
                  topLeft: r, topRight: r, bottomRight: r) ,
              border: Border.all(color: Theme.of(context).lightTextColor),
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
            margin: EdgeInsets.only(bottom:mq.height*0.02,right: mq.width*0.02),
            padding: EdgeInsets.symmetric(horizontal: mq.width*0.02, vertical: mq.height*0.01),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.only(
                  topLeft: r, topRight: r, bottomLeft: r),
              border: Border.all(color: Theme.of(context).lightTextColor),
            ),
            child: Text(Message.msg,textAlign: TextAlign.center,))
      ],
    );
  }
}
