import 'package:chatbot/Models/message.dart';
import 'package:chatbot/api/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class chat_Controller extends GetxController{
  final text=TextEditingController();
  final list=<message>[].obs;
  Future<void> askQuestion() async {
    if(text.text.trim().isNotEmpty){

      list.add(message(msg: text.text, msgType: MessageType.user));
      list.add(message(msg: "Please Wait", msgType: MessageType.bot));
      final res= await Apis.getanswer(text.text);


      list.add(message(msg: res, msgType: MessageType.bot));
      text.text="";
    }
  }
}
