import 'package:chatbot/Helper/Global.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';



import 'SplashScreen/splash.dart';

import 'api/apis.dart';
import 'firebase_options.dart';

 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,


  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          elevation: 10,
          centerTitle: true,

          titleTextStyle: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold
             ),
        ),
      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 10,
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.blue, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      home: Splashscreen(),
    );
  }
}
extension AppTheme on ThemeData{
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;
  Color get buttoncolor=>brightness==Brightness.dark?Colors.cyan.withOpacity(0.5):Colors.blue;
}
