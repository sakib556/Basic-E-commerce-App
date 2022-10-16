import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/controllers/product_controller/get_product_controller.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:flutter_ecommerce/screens/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final GetProductController productController = Get.put(GetProductController());
  FirebaseAuth? _authentication;
  User? user;
  bool isLoading = true;
  Future splashTimer() async {
    await productController.fetchProducts();
    Timer(const Duration(seconds: 2), () => navigateScreen());
  }

  navigateScreen() {
    _authentication = FirebaseAuth.instance;
    user = _authentication?.currentUser;
    isLoading = false;
    Get.off(user == null ? LoginScreen() : HomeScreen());
  }
}
