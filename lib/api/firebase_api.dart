
import 'package:assignment_2/ui/person_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/bottom_navbar.dart';


class FirebaseAPIs{

 static  FirebaseAuth auth = FirebaseAuth.instance;
 static User? currentUser = FirebaseAuth.instance.currentUser;
 static String verificationId = '';





 static  logInWithEmailAndPassword(BuildContext context, TextEditingController _emailController, TextEditingController _passwordController) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        // Navigate to another screen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PersonInfo(),
          ),
        );
      }
      // Successful sign-in, you can navigate to the next screen or do other actions here.
      print("Logged in as: ${userCredential.user!.email}");
    } catch (e) {
      // Handle sign-in errors, e.g., wrong credentials, network issues, etc.
      print("Error signing in: $e");
    }
  }


 static signInWithEmailAndPassword(BuildContext context,TextEditingController _emailController,TextEditingController _passwordController) async {
   try {
     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
       email: _emailController.text.trim(),
       password: _passwordController.text.trim(),
     );
     // Successful sign-in, you can navigate to the next screen or do other actions here.
     print("Signed in as: ${userCredential.user!.email}");

     if (userCredential.user != null) {
       // Navigate to another screen after successful login
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(
           builder: (context) => PersonInfo(),
         ),
       );
     }

   } catch (e) {
     // Handle sign-in errors, e.g., wrong credentials, network issues, etc.
     print("Error signing in: $e");
   }
 }










 static  void signInWithSmsCode(BuildContext context, String verificationController) async {

     String smsCode = verificationController;
     print('$smsCode');

     PhoneAuthCredential credential = PhoneAuthProvider.credential(
       verificationId: verificationId,
       smsCode: smsCode,

     );

     try {
       await auth.signInWithCredential(credential);
       print('$smsCode');
       Navigator.push(context, CupertinoPageRoute(builder: (context)=>BottomNavbar()));
       print('Signed in with SMS code');
     } catch (e) {
       print('Error signing in with SMS code: $e');
     }
   }














}