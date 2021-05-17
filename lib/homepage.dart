import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdemo/authcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'alldata.dart';
import 'gal.dart';
import 'package:image_picker/image_picker.dart';



class Home extends GetWidget<AuthController>{
 TextEditingController namecontrol = TextEditingController();
 TextEditingController agecontrol = TextEditingController();


  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     home : Scaffold(
//backgroundColor: Colors.deepPurpleAccent,
appBar: AppBar(
title: Text("Welcome"),
backgroundColor: Colors.greenAccent,
),
         drawer: Drawer(
           child: ListView(
             padding: EdgeInsets.zero,
             children: <Widget>[
               DrawerHeader(
                 child: Text("Options"),


                 decoration: BoxDecoration(color: Colors.black26),
               ),
               ListTile(
                 title: Text(""
                     "Image upload"),
                 onTap: () {
Get.to(Gal());
                 },
               )  ,


               ListTile(
                 title: Text("Get all data"),
                 onTap: () {
Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>All()));
                 },
               ),


               ListTile(
                 title: Text("Logout"),
                 onTap: () {
 controller.signout();
                 },
               )


             ],
           ),
         ),
     body:

Center(

  child : Column(
    children: [

      Text("Save The Data " ,style: TextStyle(fontSize: 40),),

      TextField(


        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Name',
        ),
controller: namecontrol,
      )
      ,
      SizedBox(height: 20,),

      TextField(


        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Age',
        ),
        controller: agecontrol,

      )
     ,


     FlatButton(onPressed: (){
       Map <String,dynamic> data = {
         "field1" :namecontrol.text,"field2" :agecontrol.text
       };
       FirebaseFirestore.instance.collection("test").add(data);
namecontrol.clear();
agecontrol.clear();

     }, child: Text("Submit"),
     color: Colors.redAccent,
     ),
      SizedBox( height: 20,)

    ],
  )


),


     ),

   );

  }
}