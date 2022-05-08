import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
class LoginController extends GetxController{
   var obscureText= true ;
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   final ProductController productController = Get.put(ProductController());
   signIn() async{
      try {
         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
             email: emailController.text,
             password: passwordController.text
         );
         var authCredential = userCredential.user;
         print(authCredential!.uid);
         if(authCredential.uid.isNotEmpty){
            await productController.fetchProducts();
            Get.offAll(HomeScreen());
         }
         else{
            Fluttertoast.showToast(msg: "Something is wrong");
         }
      } on FirebaseAuthException catch (e) {
         if (e.code == 'user-not-found') {
            Fluttertoast.showToast(msg: "No user found for that email.");
         } else if (e.code == 'wrong-password') {
            Fluttertoast.showToast(msg: "Wrong password provided for that user.");
         }
      } catch (e) {
         print(e);
      }
   }
}