import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/screens/home/local_widgets/product_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
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
            print("start obx");
            if (productController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                itemBuilder: (context, index) {
                  print("start 2 obx");
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              );
            }
          }),
        ),
      ],
    ));
  }
}
