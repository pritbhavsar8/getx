import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){

            Get.back();

          }, child: Text("BACK"))
        ],
      ),
    );
  }
}
