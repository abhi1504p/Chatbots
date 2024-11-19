import 'package:chatbot/Widgets/Roundbutton.dart';
import 'package:chatbot/auth/Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Signuppage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  void _login() {
    if (_formKey.currentState!.validate()) {
      auth.createUserWithEmailAndPassword(email:_emailController.text.toString().trim(), password:_passwordController.text.toString());

      // Implement your login logic here

    }

  }
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Sign Up")),

        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email TextField
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
                  onPressed: _login,
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
}
