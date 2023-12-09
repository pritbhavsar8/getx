import 'package:flutter/material.dart';
import 'package:getx/controllers/EmployeController.dart';
import 'package:get/get.dart';

class AddEmploye extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    EmployeController obj = Get.put(EmployeController());
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            color: Color(0xfffff3e0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text("Name"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: obj.name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("Salary"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: obj.salary,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("gender"),
                SizedBox(height: 15.0,),
                Row(
                  children: [
                    Radio(
                        value: "male",
                        groupValue: obj.gender,
                        onChanged: (val){
                          obj.gender(val.toString());
                        }
                    ),
                    Text("Male"),
                    SizedBox(width: 15.0,),
                    Radio(
                        value: "female",
                        groupValue: obj.gender,
                        onChanged: (val){
                          obj.gender(val.toString());
                        }
                    ),
                    Text("Female"),
                  ],
                ),
                SizedBox(height: 10.0,),
                Text("Department"),
                DropdownButton(
                  dropdownColor: Colors.orangeAccent.shade100,
                  value: obj.selected,
                  onChanged: (val){
                    obj.selected(val.toString());
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text("Sale"),
                      value: "sale",
                    ),
                    DropdownMenuItem(
                      child: Text("HR"),
                      value: "hr",
                    ),
                    DropdownMenuItem(
                      child: Text("Purchase"),
                      value: "purchase",
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                //Button

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: () async{

                          await obj.AddEmploye();
                          if(obj.isinserted==true)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(obj.msg.toString(),style: TextStyle(color: Colors.white),),
                                  backgroundColor: Colors.green,
                                )
                            );
                          }
                          else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(obj.msg.toString(),style: TextStyle(color: Colors.white),),
                                  backgroundColor: Colors.red,
                                )
                            );
                          }

                        },
                        child: Text("Add"),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),),
    );
  }
}


