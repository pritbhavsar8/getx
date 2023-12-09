import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class OthersController extends GetxController
{

 // var name = "ABC";

  // RxString name="ABC".obs;
  // TextEditingController firstname = TextEditingController();
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  RxInt number1 = 0.obs;
  RxInt number2 = 0.obs;
  RxInt add = 0.obs;


  display()
  {
   // // print("Method Called");
   // //  name("XYZ");
   //  name.value = firstname.text.toString();
    number1.value = int.parse(num1.text.toString());
    number2.value= int.parse(num2.text.toString());
    add.value = int.parse(num1.text.toString()) + int.parse(num2.text.toString());
  }

}