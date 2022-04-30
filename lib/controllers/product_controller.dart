import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/services/remote_services.dart';
import 'package:get/state_manager.dart';
class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        isLoading(false);
      }
  }
}