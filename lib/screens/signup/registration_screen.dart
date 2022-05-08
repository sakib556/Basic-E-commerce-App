import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/signup_controller.dart';
import 'package:get/get.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  final SignupController _signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/register.png'),fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
              children:  [
                Container(
                  padding: EdgeInsets.only(left: 60,top: 100),
                  child: Text('Welcome \nBuddy',style: TextStyle(color: Colors.white,fontSize: 30,),),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5,right: 35,left: 35),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        TextField(
                          controller: _signupController.emailController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Email',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                        SizedBox(height: 20,),
                        TextField(
                          controller: _signupController.passwordController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Password',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sign in',style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700,color: Color(0xff4c505b)),),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: (){_signupController.signUp();},
                                icon: Icon(Icons.arrow_forward),
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: (){},
                                child: Text('Log in',style: TextStyle(decoration: TextDecoration.underline,fontSize: 20,color: Color(0xff4c505b) ),)

                            ),
                            TextButton(
                                onPressed: (){},
                                child: Text('Forgot Password',style: TextStyle(decoration: TextDecoration.underline,fontSize: 20,color: Color(0xff4c505b) ),)

                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]
          ),
        )
    );
  }
}

