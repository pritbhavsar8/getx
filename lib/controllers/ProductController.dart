import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx/models/AllProduct.dart';
import 'package:getx/views/others/HomeScreen.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../resources/UrlResources.dart';

class ProductController extends GetxController
{
  TextEditingController name = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController price = TextEditingController();


  RxBool isinsert = false.obs;
  RxString insertmessage = "".obs;

  @override
  void onInit() {
    viewproduct();
  }

  addproduct() async
  {
    var params = {
      "pname": name.text.toString(),
      "qty": qty.text.toString(),
      "price": price.text.toString(),
    };

    try
    {
      await ApiHandler.postRequest(UrlResources.ADD_PRODUCT, body: params)
          .then((json) {
        if (json["status"] == "true") {
          isinsert(true);
          insertmessage(json["message"].toString());
        }
        else {
          isinsert(false);
          insertmessage(json["message"].toString());
        }
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
        Get.to(HomeScreen());
      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }

  RxList<AllProduct> alldata = <AllProduct>[].obs;
  viewproduct() async
  {
    try {
      await ApiHandler.postRequest(UrlResources.VIEW_PRODUCT).then((json) {
        alldata(json["data"].map<AllProduct>((obj) => AllProduct.fromJson(obj)).toList());
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
        Get.to(HomeScreen());
      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }

  RxBool isdeleted = false.obs;
  RxString deletemsg = "".obs;
  deleteproduct(pid,params) async
  {
    try
    {
      await ApiHandler.postRequest(UrlResources.DELETE_PRODUCT, body: params)
          .then((json) {
        if (json["status"] == "true") {
          isdeleted.value=(true);
          deletemsg(json["message"].toString());
          viewproduct();
        }
        else {
          isdeleted(false);
          deletemsg(json["message"].toString());
        }
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
        Get.to(HomeScreen());
      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }
  AllProduct? obj;
  RxString updateid = "".obs;
  getsingleproduct(pid) async
  {
    try
    {
      var params = {
        "pid":pid
      };
      await ApiHandler.postRequest(UrlResources.GET_SINGLE_PRODUCT, body: params)
          .then((json) {
            obj = AllProduct.fromJson(json["data"]);
            updateid(obj!.pid.toString());
            name.text = obj!.pname.toString();
            qty.text = obj!.qty.toString();
            price.text = obj!.price.toString();
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
        Get.to(HomeScreen());
      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }

  RxBool isupdate=false.obs;

  updateproduct() async
  {
    var params = {
      "pname": name.text.toString(),
      "qty": qty.text.toString(),
      "price": price.text.toString(),
      "pid":updateid.toString()
    };
    try
    {

      await ApiHandler.postRequest(UrlResources.EDIT_PRODUCT, body: params)
          .then((json) {
       if(json["status"]=="true")
         {
           viewproduct();
           isupdate(true);
         }
       else
         {
           isupdate(false);
         }
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {
        //rdirect to no internet page
        Get.to(HomeScreen());
      }
      else if (ex.message.toString() == "Bad Response Format") {
        //redirect to support page
      }
    }
  }


}
