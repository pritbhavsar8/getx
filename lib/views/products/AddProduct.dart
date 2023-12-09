import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/ProductController.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController c = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Product"),
      ),
      body:  SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            color: Color(0xfffff3e0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text("Name:"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: c.name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("Qty:"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: c.qty,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text("Price:"),
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    controller: c.price,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          borderSide: BorderSide(
                              color: Colors.grey
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),

                //Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: () async
                        {
                          await c.addproduct();
                          if(c.isinsert==true)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(c.insertmessage.toString()))
                            );
                          }
                          else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(c.insertmessage.toString()))
                            );
                          }
                        },
                        child: Text("Add"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
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
      )


    );
  }
}
