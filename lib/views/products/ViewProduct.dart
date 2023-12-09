import 'dart:convert';
import 'package:getx/views/products/EditProduct.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/ProductController.dart';


class AllProductWithModel extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    ProductController c = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text("All Product With Model"),
        centerTitle: true,
      ),
      body: Obx(()=>(c.alldata==null)?CircularProgressIndicator():ListView.builder(
        itemCount: c.alldata.length,
        itemBuilder: (context, index)
        {
          return InkWell(
            onTap: (){
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => AllProductView(
              //     obj: provider!.alldata![index],
              //   ),),
              // );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Text(c.alldata![index].pid.toString()),
                    Text(c.alldata![index].pname.toString()),
                    Text(c.alldata![index].qty.toString()),
                    Text(c.alldata![index].price.toString()),
                    Text(c.alldata![index].addedDatetime.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: ()async
                            {
                              var pid = c!.alldata![index].pid.toString();
                              var params =
                              {
                                "pid":pid
                              };
                             await c.deleteproduct(pid,params);
                             if(c.isdeleted==true)
                               {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text(c.deletemsg.toString(),))
                                 );
                               }
                             else
                             {
                               ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(content: Text(c.deletemsg.toString()))
                               );
                             }

                            },
                            icon: Icon(Icons.delete_rounded,color: Colors.red,)
                        ),
                        IconButton(
                            onPressed: () async{

                              var pid = c!.alldata![index].pid.toString();
                              await c.getsingleproduct(pid);


                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => EditProduct(),)
                              );
                            },
                            icon: Icon(Icons.edit,color: Colors.green,)
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),)
    );
  }
}








