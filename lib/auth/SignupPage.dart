import 'package:chatbot/Pages/Selectpage.dart';
import 'package:chatbot/Widgets/Roundbutton.dart';
import 'package:chatbot/auth/Loginpage.dart';
import 'package:chatbot/auth/services_auth.dart';
import 'package:chatbot/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}
class _SignuppageState extends State<Signuppage> {
  final authservice _auth=authservice();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override

  void dispose(){
    _name.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Sign Up")),

        backgroundColor: Theme.of(context).lightTextColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // name TextField
            TextFormField(
            controller:_name,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText:'Name',
              border: OutlineInputBorder(),
            ),

          ),
            SizedBox(height: 10,),

            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              // Password TextField
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: signup,
                  child: const Text('Sign Up',style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
              const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have account"),
                  TextButton(onPressed: () {Navigator.push(context ,MaterialPageRoute(builder:(context) =>const LoginPage()));

                  }, child: const Text("login"))
                ],
              )
            ],
          )
        ),
      ),
    );
  }
  Future<void> signup() async {
    String username=_name.text;
    String emailname=_emailController.text;
    String passwordname=_passwordController.text;
    User? user=await _auth.signupwithemailandPassword(emailname, passwordname);
    if(user !=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>selectpage()));
    }
    else{
      print("some error occured");
    }

  }
}

