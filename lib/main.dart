import 'package:dbdemo/bind.dart';
import 'package:dbdemo/oncesignin.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}


class Myapp extends StatefulWidget{

  State<StatefulWidget>createState ()
  {
    return MyappState();
  }

}
class MyappState extends State<Myapp>{

//  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

initialBinding: AuthBinding(),
home:
Signindone(),


    );

  }

}


