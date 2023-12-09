import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getx/controllers/AuthController.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    AuthController obj = Get.put(AuthController());
    return  Scaffold(
      backgroundColor: Color(0xffFBFAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            Text("Login",style: TextStyle(
              fontFamily: "SourceSansPro",
              fontWeight: FontWeight.w700,
              color: Color(0xff010101),
              fontSize: 20.0,
            ),),
            SizedBox(height: 20.0,),
            //TextField,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: TextField(
                controller: obj.name,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    label : Text("Email",style: TextStyle(
                        color:Colors.grey
                    ),),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(15.0),
              child: TextField(
                obscureText: true,
                controller: obj.password,
                keyboardType: TextInputType.visiblePassword,

                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    label : Text("Password",style: TextStyle(
                        color:Colors.grey
                    ),),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            //button

            Container(
              width: 130.0,
              child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),

                  ) ,
                  onPressed: () async{
                    await obj.Login(context);
                  },
                  child: Text("Login")
              ),
            ),
            SizedBox(height: 10.0,),
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Don’t Have an account?",
                          style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xff010101),
                            fontSize: 15.0,
                          )
                      ),
                      TextSpan(
                          text: " Create",
                          recognizer: TapGestureRecognizer()..onTap = (){
                          },
                          style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFE7551),
                            fontSize: 15.0,
                          )
                      ),
                    ]
                )
            )
          ],
        ),
      ),

    );
  }
}


