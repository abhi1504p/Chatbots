import 'dart:async';

import 'package:chatbot/Pages/Selectpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/Loginpage.dart';

class splashscreen {
  void islogin(BuildContext context) {
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
   if(user!=null){ Timer(
       Duration(seconds: 3),
           () =>Get.off(()=>LoginPage()));

   }
   else{
     Timer(
         Duration(seconds: 3),
             () => Get.off(()=>LoginPage()));

   }
  }
}
