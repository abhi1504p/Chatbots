import 'package:chatbot/auth/Loginpage.dart';
import 'package:chatbot/main.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslateScreen extends StatefulWidget {
  const LanguageTranslateScreen({super.key});

  @override
  State<LanguageTranslateScreen> createState() =>
      _LanguageTranslateScreenState();
}

class _LanguageTranslateScreenState extends State<LanguageTranslateScreen> {
  final translator = GoogleTranslator();
  final translationController = TextEditingController();

  String inputText = '';
  String fromLanguage = 'en';
  String toLanguage = 'fr';

  textTranslator() async {
    final translation = await translator.translate(inputText,
        from: fromLanguage, to: toLanguage);

    setState(() {
      translationController.text = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ai Translator"),
      ),
      backgroundColor: const Color(0xff1f1f22),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Image.asset('assets/images/translate.jpg',width: double.infinity,height: 300,fit: BoxFit.fill,),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 5,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      inputText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter what you want to translate",
                      fillColor: Colors.black,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 6.0,  color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: fromLanguage,
                      dropdownColor: Colors.black,
                      items: const <String>[
                        'en',
                        'fr',
                        'de',
                        'ja',
                        'zh',
                      ].map<DropdownMenuItem<String>>(
                            (String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(
                              val,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          fromLanguage = value!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                      value: toLanguage,
                      dropdownColor: Colors.black,
                      items: const <String>[
                        'en',
                        'fr',
                        'de',
                        'ja',
                        'zh',
                      ].map<DropdownMenuItem<String>>(
                            (String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(
                              val,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          toLanguage = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: translationController,
                  maxLines: 5,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Colors.black,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 6.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      textTranslator();
                    },
                    child: const Text(
                      'Translate',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}