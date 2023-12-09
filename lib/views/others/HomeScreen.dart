import 'package:flutter/material.dart';
import 'package:getx/controllers/OthersController.dart';
import 'package:get/get.dart';

import 'AboutScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OthersController c = Get.put(OthersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          children: [
            // TextField(
            //   controller: c.firstname,
            //   keyboardType: TextInputType.text,
            // ),
            Text("Number: 1"),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: c.num1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
            ),
            Text("Number: 2"),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller:c.num2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.grey
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              //  Get.to(AboutScreen());
              c.display();
            }, child: Text("About Screen")),
            Text(c.add.toString()),
          ],
        ),
      ),),
    );
  }
}
