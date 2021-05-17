import 'package:dbdemo/Phoneui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'authcontroller.dart';
import 'Phoneui.dart';


class Signup extends GetWidget<AuthController> {
  // String email;
  //String password;
//final auth = FirebaseAuth.instance;
  // final _firestore = FirebaseFirestore.instance;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("New User"),backgroundColor: Colors.greenAccent,
        ),
          body:

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: emailcontroller,
            ),


            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller:  passwordcontroller,
            ),


            SizedBox(
              height: 20,
            ),


            FlatButton(onPressed: () {

              controller.createuser(emailcontroller.text, passwordcontroller.text);

            }, child: Text("Register"),
            color: Colors.pink,),

SizedBox(height :20),
            FlatButton(onPressed: () {

           //   controller.createuser(emailcontroller.text, passwordcontroller.text);

              Get.to(LoginScreen());
            }, child: Column( // Replace with a Row for horizontal icon + text
    children: <Widget>[
    Icon(Icons.phone),
    Text("Sign in Mobile"),
    ],
    ),color: Colors.pink,
            )

    ],
        ),
      ),
    );
  }
}




