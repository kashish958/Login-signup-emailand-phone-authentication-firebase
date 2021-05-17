
 import 'package:dbdemo/authcontroller.dart';
import 'package:get/get.dart';


//Intialize the authcontroller taki sab widgets isse use kr ske//

 class AuthBinding extends Bindings {
   @override
   void dependencies() {
     Get.put<AuthController>(AuthController(), permanent: true);
   }
 }

//as to use authcontroller through out we just made the intialize the  instance of authcontroller lazy put sab depencdencies load kregi and make available when needed by widgets//
//class Initializebinding extends Bindings{

