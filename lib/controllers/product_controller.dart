import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/services/remote_services.dart';
import 'package:get/state_manager.dart';
class ProductController extends GetxController {
  var isLoading;
  var productList = <Product>[].obs;
  fetchProducts() async {
    isLoading = true.obs;
    print("fetching start");
    isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        isLoading(false);
      }
  }
}