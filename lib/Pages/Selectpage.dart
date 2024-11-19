import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class selectpage extends StatelessWidget {
   selectpage({super.key});
final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout),color: Colors.black,)],
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
    );
  }
}
