import 'package:dbdemo/Login.dart';
import 'package:dbdemo/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';

//as to use authcontroller through out we just made the intialize the  instance of authcontroller lazy put sab depencdencies load kregi and make available when needed by widgets//

//once login is done then it will remain logged in after restart//
class Signindone extends GetWidget<AuthController>{

  @override
  Widget build(BuildContext context){
    return
      StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, user) {
          if (user.hasData) {
            return Home();
          }
          return Login();
        });
  }

}









