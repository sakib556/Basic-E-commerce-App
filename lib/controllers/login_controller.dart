import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller/get_product_controller.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:flutter_ecommerce/screens/login/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var obscureText = true.obs;
  var emailController = TextEditingController().obs;
  var resetEmailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLoading = false.obs;
  final GetProductController productController = Get.put(GetProductController());
  signIn() async {
    isLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.value.text,
              password: passwordController.value.text);
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        await productController.fetchProducts();
        isLoading(false);
        Get.offAll(HomeScreen());
      } else {
        isLoading(false);
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    } catch (e) {
      isLoading(false);
      print(e);
      Fluttertoast.showToast(msg: " $e");
    }
  }

  resetPassword(String email) async {
    try {
      isLoading(true);
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetEmailController.value.text);
      Get.to(LoginScreen());
      isLoading(false);
      Fluttertoast.showToast(
          fontSize: 10,
          msg: "Password reset successfully .\n "
              "Please check your email & enter the new password.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      } else {
        Fluttertoast.showToast(msg: "This is not valid or registered email.");
        isLoading(false);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "This is not valid or registered email.");
      isLoading(false);
    }
  }

  var screenwidth = 0.obs;
}
