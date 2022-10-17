import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
 var isLoading = false.obs;
  var productList = <Stackdatum>[].obs;
  var productModel = Product(stackdata: []).obs;

  Future<void> fetchProducts() async {
    print("fetching start");
    isLoading.value = true;
    try {
      String url = "https://vaizans.com/PHP_API/show_sellers_product.php";
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
         productModel.value = Product.fromMap(json.decode(response.data));
          print("data get 2");
        productList.value = productModel.value.stackdata;
      } else {
        print("fetching null");
      }
      isLoading.value = false;
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> insertProduct() async {
     String url = "https://vaizans.com/PHP_API/add_sellers_product.php";
  //   await http.post(Uri.parse(url), body: {
  //     "pname": pname,
  //     "price": pprice,
  //     "discount": pdiscount,
  //     "brand": pbrand,
  //     "quantity": pqty,
  //     "quantity_type": qtyType,
  //     "product_details": pdetails
  //   });
  //   setState(() {
  //     addData = 0;
  //   });
  //   productController.isLoading.value;
  //   await productController.fetchProducts();
  //   Get.off(BottomNavbarScreen());
 }
}

List<Stackdatum> dataFromProduct(String data) => List<Stackdatum>.from(
    json.decode(data).map((x) => Stackdatum.fromMap(x)));

