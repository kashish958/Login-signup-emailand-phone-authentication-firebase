import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Login.dart';
import 'homepage.dart';
import 'oncesignin.dart';
class AuthController extends GetxController{

  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>(); //this is observable //reactive method kust like obs
//So, GetX only updates the screen, when the Rx variable changes it's value.
  String get user => _firebaseUser.value?.email; //Null safety k liye kia yhe  agar yhe null hua to null return krega

void onInIt(){
//This receives a new value each time the user signs in or out. //kind of listener provided by firebase for checking user is logged in or not//
  _firebaseUser.bindStream(_auth.authStateChanges()); // Initially hi jese authentication m state change hogi tabh vo user m update krdega
}

//isko future type ka isiliye rkhte h kyunki we are calling database storing in it so it takes time//
void createuser(String email,String password) async{

  try{
await _auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) => Get.offAll(Login()))// of all navigate to that class and ignore all previous routes
.catchError((error)=>
Get.snackbar("Error in creating user ", error.message,snackPosition: SnackPosition.BOTTOM),
);
Get.offAll(Signindone());
  }
  catch(e)
  {
Get.snackbar("Error agya create m  ", e.message,snackPosition: SnackPosition.BOTTOM);
  }

 }



void login(String email,String password) async{

  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(Home()))
        .catchError((onError)=>
        Get.snackbar("Error in logging  user ", onError.message,snackPosition: SnackPosition.BOTTOM));


  }
  catch(e)
  {
   Get.snackbar("Error agya login m ", e.message,snackPosition: SnackPosition.BOTTOM);

  }
}


void signout() async
{
  try{
    await _auth.signOut().then((value) => Get.offAll(Login()));


  }
  catch(e){

    Get.snackbar("Error in signout user ", e.message,snackPosition: SnackPosition.BOTTOM);

  }
}









}