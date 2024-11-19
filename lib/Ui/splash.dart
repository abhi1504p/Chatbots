import 'package:chatbot/Ui/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Widgets/splashanimation.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<Splashscreen> {
  splashscreen splash = splashscreen();
  @override
  @override
  void initState() {
    // TODO: implement initState
    splash.islogin(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/splashimage.png"))),
      )),
    );
  }
}
