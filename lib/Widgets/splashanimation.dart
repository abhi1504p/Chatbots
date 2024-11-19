import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
 class splashanimation extends StatelessWidget {
   const splashanimation({super.key});
 
   @override
   Widget build(BuildContext context) {
     return Lottie.asset("assets/lottie/splashanimation.json",width: double.infinity,height: 270,fit: BoxFit.contain);
   }
 }
