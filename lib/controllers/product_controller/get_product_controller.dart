import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:get/state_manager.dart';

class GetProductController extends GetxController {
  var isLoading = false.obs;
  var productList = <Stackdatum>[].obs;
  var productModel = Product(stackdata: []).obs;

  fetchProducts() async {
    print("fetching start");
    isLoading.value = true;
    try {
      String url = "https://vaizans.com/PHP_API/show_sellers_product.php";
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
         productModel.value = Product.fromMap(response.data);
          print("data get");
        //productList.value = Product.fromJson(response.data);
      } else {
        print("fetching null");
      }
      isLoading.value = false;
    } catch (e) {
      print("error gets $e");
    }
  }
}

List<Stackdatum> dataFromProduct(String data) => List<Stackdatum>.from(
    json.decode(data).map((x) => Stackdatum.fromMap(x)));

