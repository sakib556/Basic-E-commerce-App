import 'package:flutter_ecommerce/controllers/signup_controllert.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  HomeScreenController() {
    final SignupController _signupController = Get.put(SignupController());
    _signupController.verifyCheck();
  }
  var selected_index = 0.obs;
  void onItemTapped(int index) {
    selected_index(index);
    print("tapped item $selected_index");
  }
}
