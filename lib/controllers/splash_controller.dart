import 'dart:async';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/views/pages/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  final ProductController productController = Get.put(ProductController());
  Future splashTimer() async{
   await Timer(Duration(seconds: 3),() => Get.off(HomeScreen()));
   await productController.fetchProducts();

  }
}