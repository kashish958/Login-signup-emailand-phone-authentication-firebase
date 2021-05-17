import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import'dart:io';

class Gal extends StatefulWidget{

  @override
  State<StatefulWidget>createState(){
    return GalState();
  }
}
class GalState extends State<Gal> {

  File imageFile;
  final picker = ImagePicker();

  Future choose(ImageSource source) async {
    final pickedimage = await picker.getImage(source: source);

    setState(() {
      imageFile = File(pickedimage.path);
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(



            body:
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child :imageFile!=null?
                        Container( height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(
                                      imageFile
                                  )
                              )
                          ),
                        ):
                        Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey
                            )
                        )

                    ),

                    Container(
                        child :Row(
                          children: [

                            FlatButton(onPressed: (){
                              choose(ImageSource.camera);
                            },child : Text ("Camera"),
                              color: Colors.redAccent,),
                            SizedBox(width: 180,),

                            FlatButton(onPressed: (){
                              choose(ImageSource.gallery);

                            },child : Text ("Gallery"),
                              color: Colors.redAccent,)

                          ],
                        )

                    )
                  ],
                )
            )

        )


    );
  }
}
