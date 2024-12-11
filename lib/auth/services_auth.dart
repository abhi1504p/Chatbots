import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chatbot/auth/services_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authservice{
   FirebaseAuth _auths=FirebaseAuth.instance;

  Future<User?>signupwithemailandPassword(String email,String password)async{
    try{
      UserCredential credential= await _auths.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("Some error occured");
    }
    return null;

  }
  Future<User?> signInwithemailandPassword(String email,String password)async{
    try{
      UserCredential credential= await _auths.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print("Some error occured");
    }
    return null;

  }
}