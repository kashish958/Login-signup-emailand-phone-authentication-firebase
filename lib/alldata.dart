
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget{

  State<StatefulWidget>createState(){return Allstate();}
}
class Allstate extends State<All>{


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title:  Text("List of all users"),
          backgroundColor: Colors.greenAccent,
        ),body:
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('test').snapshots() ,
            builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData)return Text("No value");
              return ListView(
                children: snapshot.data.docs.map((document){
                  return
                   ListTile(
                     title: Text(document['field1']),
                     subtitle:  Text(document['field2']),
                   );
                }).toList(),
              );
            },
          )

      )
    );
  }

}