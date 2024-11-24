import 'package:chatbot/Models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class chat_Controller extends GetxController{
  final text=TextEditingController();
  final list=<message>[].obs;
  void askQuestion(){
    if(text.text.trim().isNotEmpty){
      list.add(message(msg: text.text, msgType: MessageType.user));
      list.add(message(msg: "I have r", msgType: MessageType.bot));
      text.text="";
    }
  }


}