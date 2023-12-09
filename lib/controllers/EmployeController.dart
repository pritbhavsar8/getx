import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/helpers/ApiHandler.dart';
import 'package:getx/helpers/ErrorHandler.dart';
import 'package:getx/resources/UrlResources.dart';

class EmployeController extends GetxController
{
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();
  RxString selected = "sale".obs;
  RxString gender = "male".obs;

  RxBool isinserted = false.obs;
  RxString msg = "".obs;
  AddEmploye() async{
    var para = {
      "ename":name.text.toString(),
      "salary": salary.text.toString(),
      "department": selected,
      "gender": gender,
    };
    try
    {
      await ApiHandler.postRequest(UrlResources.ADD_EMPLOYE, body: para)
          .then((json) {
        if (json["status"] == "true") {
          if(isinserted==true)
            {
              isinserted(true);
              msg(json["message"].toString());
            }
          else {
            isinserted(false);
            msg(json["message"].toString());
          }
        }

      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
        // Get.to(HomeScreen());
      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }
  ViewEmploye()async{

  }


}