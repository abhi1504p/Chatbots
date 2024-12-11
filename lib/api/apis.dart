import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatbot/Helper/Global.dart';
import 'package:http/http.dart';

class Apis {
  static Future<String> getanswer(String question) async {
    try {
      final res = await post(
        Uri.parse(
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyAWwJVRyWlJGIa-8wYa_n5bp4kNKf0SXMI"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({

          "contents": [
            {
              "parts": [
                {"text": question}
              ]
            }
          ]
        }),
      );
      final data = jsonDecode(res.body);
      return ("${data["candidates"][0]["content"]["parts"][0]["text"]}");
    }

    catch (e) {
      log("getanswer$e");
      return "Something went Wrong Try later";
    };
  }

}
