import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/signup/local_widgets/user_form.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
class SignupController extends GetxController{
  var emailController=TextEditingController();
  var passwordController =TextEditingController();
  signUp() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var authCredential=userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Get.offAll(UserForm());
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
}