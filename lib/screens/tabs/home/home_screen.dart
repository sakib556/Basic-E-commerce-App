import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/screens/tabs/home/components/product_tile.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ProductController productController =
      Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Vaizans Online Shopping',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.view_list_rounded), onPressed: () {}),
          IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
        ],
      ),
    ),
    Expanded(
      child: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return ProductTile(
                productController.productList[index],
              );
            },
          );
        }
      }),
    ),
      ],
    );
  }
}
