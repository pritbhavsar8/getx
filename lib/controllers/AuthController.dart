import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
class AuthController extends GetxController
{
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  Login(context) async
  {
    var params = {
      "name": name.text.toString(),
      "password": password.text.toString(),
      "device_token":"12345678",
      "device_os":"android"
    };

    var h = {
      "Content-Type":"application/json"
    };
    try
    {
      await ApiHandler.postRequest("https://begratefulapp.ca/api/login",body:jsonEncode(params),headers: h).then((json) {
        if(json["result"]=="success")
        {
          var msg = json["message"].toString();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msg,style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.green,
              )
          );
        }

      });
    }
    on ErrorHandler catch (ex)
    {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page

      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }

}