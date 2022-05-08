import 'dart:async';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/screens/home/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  final ProductController productController = Get.put(ProductController());
 // await productController.fetchProducts();
  Future splashTimer() async{
   await Timer(Duration(seconds: 3),() => Get.off(HomeScreen()));
   await productController.fetchProducts();

  }
}