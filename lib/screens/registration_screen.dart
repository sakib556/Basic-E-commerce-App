import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/custom_widget/user_form.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController  _emailController=TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  signUp() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
      );
      var authCredential=userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
      }
      else{
        Fluttertoast.showToast(msg: "Something is wrong.");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }
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
                          controller: _emailController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Email',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),),
                        SizedBox(height: 20,),
                        TextField(
                          controller: _passwordController,
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
                                onPressed: (){signUp();},
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

