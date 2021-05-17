import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'authcontroller.dart';



class Login extends GetWidget<AuthController> {
  //String email;
 // String password;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Firebase demo"),backgroundColor: Colors.greenAccent,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              controller: emailController,
            ),


            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              controller: passwordController,

            ),



            FlatButton(
              onPressed: () { 
                
                controller.login(emailController.text, passwordController.text);
              },
              child: Text("Login"),
              color: Colors.pink,
            ),

            SizedBox(height: 20),

            FlatButton(onPressed: () {

              Get.to(Signup());
            }, child: Column(
              children: [
                Text("New User"),
                Icon(Icons.person_add)
              ],
            ),color: Colors.pink,



            ),


          ],
        ),
      ),
    );
  }
}
