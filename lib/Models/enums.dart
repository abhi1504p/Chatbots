import 'package:chatbot/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../features/chatbot_features.dart';
import '../features/image_feature.dart';
import '../features/translator_features.dart';
import '../generated/assets.dart';
enum Aiselection{
  aichatbot,aiimage,aitranslator

}
extension Myaiselection on Aiselection{
  String get title=>switch(this){
    // TODO: Handle this case.
    Aiselection.aichatbot => "Ai ChatBot",
    // TODO: Handle this case.
    Aiselection.aiimage => "Ai Image Finder",
    // TODO: Handle this case.
    Aiselection.aitranslator => "Ai Translator"
  };
  String get lottie=>switch(this){
  // TODO: Handle this case.
    Aiselection.aichatbot => Assets.lottieAisearcher,
  // TODO: Handle this case.
    Aiselection.aiimage =>Assets.lottieImagegenerator,
  // TODO: Handle this case.
    Aiselection.aitranslator => Assets.lottieSplashanimation
  };
  EdgeInsets get padding=>switch(this){
  // TODO: Handle this case.
    Aiselection.aichatbot =>EdgeInsets.all(0) ,
  // TODO: Handle this case.
    Aiselection.aiimage =>EdgeInsets.all(20),
  // TODO: Handle this case.
    Aiselection.aitranslator => EdgeInsets.all(0)
  };
  VoidCallback get onTap=>switch(this){
  // TODO: Handle this case.
    Aiselection.aichatbot =>()=>Get.to(()=>chatbot_features()) ,
  // TODO: Handle this case.
    Aiselection.aiimage =>()=>Get.to(()=>image_feature()),
  // TODO: Handle this case.
    Aiselection.aitranslator =>()=>Get.to(()=>translator_features())
  };
}
