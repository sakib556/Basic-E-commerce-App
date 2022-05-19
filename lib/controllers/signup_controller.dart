import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/signup/user_form.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cpasswordController = TextEditingController();
  UserCredential? userCredential;
  signUp() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var authCredential = userCredential?.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Get.offAll(UserForm());
      } else {
        Fluttertoast.showToast(msg: "Something is wrong.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }

  var current_user = FirebaseAuth.instance.currentUser;
  var isVerified = false.obs;
  var isSendEmail = false.obs;
  verifyCheck() async {
    var current_user = FirebaseAuth.instance.currentUser;
    await current_user?.reload();
    final verify_user = current_user?.emailVerified;
    if (verify_user == true) {
      isVerified(true);
    }
  }

  verifyEmail() async {
    var current_user = FirebaseAuth.instance.currentUser;
    await current_user?.reload();
    final verify_user = current_user?.emailVerified;
    final useremail = current_user?.email;
    Fluttertoast.showToast(msg: "email verify $verify_user for $useremail");
    if (verify_user == true) {
      isVerified(true);
    } else if (isSendEmail.value == true) {
      Fluttertoast.showToast(
          msg: "Email verification already sent to your email.");
    } else {
      await current_user?.sendEmailVerification();
      Fluttertoast.showToast(msg: "The email verification has been sent.");
      isSendEmail(true);
    }
  }
}
