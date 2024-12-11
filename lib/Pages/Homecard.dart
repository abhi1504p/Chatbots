import 'package:chatbot/Models/enums.dart';
import 'package:chatbot/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import '../Helper/Global.dart';

class Homecard extends StatelessWidget {
  final Aiselection aiselection;
  const Homecard({super.key, required this.aiselection});


  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload= true;
    return Card(
      color: Colors.blue.withOpacity(.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: InkWell(
        onTap: aiselection.onTap,
        child: Row(
          children: [
            Container(
              height: 110,
              width: mq.width * 0.35,
              padding: aiselection.padding,
              child: Lottie.asset(
                aiselection.lottie,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                aiselection.title,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),


          ],

        )
        ,
      ),
    ).animate()
        .scale(duration: 2.seconds) ;
  }
}
