
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xup_chat/constants/firebase_constants.dart';
import 'package:xup_chat/loaders/loaders.dart';

class FirebaseServices extends ChangeNotifier {
  void signInUserWithEmailAndPassword(String email, String password, BuildContext context) async{
    try{
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        print(userCredential);
    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User not found')));
      }
    }
  }
}