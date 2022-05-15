import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:flutter_ecommerce/screens/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final ProductController productController = Get.put(ProductController());
  // await productController.fetchProducts();
  FirebaseAuth? _authentication;
  User? user;
  bool isLoading = true;
  Future splashTimer() async {
    await Timer(Duration(seconds: 2), () => navigateScreen());
    await productController.fetchProducts();
  }

  navigateScreen() {
    _authentication = FirebaseAuth.instance;
    user = _authentication?.currentUser;
    isLoading = false;
    Get.off(user == null ? LoginScreen() : HomeScreen());
  }
}
