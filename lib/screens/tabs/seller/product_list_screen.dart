import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:get/get.dart';
import 'package:flutter_ecommerce/screens/custom_widgets/validating_textfield.dart';
import 'package:flutter_ecommerce/screens/custom_widgets/space_vertical.dart';

final TextEditingController _pNameController = TextEditingController(),
    _pPriceController = TextEditingController(),
    _pDiscountController = TextEditingController(),
    _pBrandController = TextEditingController(),
    _pQtyController = TextEditingController(),
    _pDetailsController = TextEditingController();

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController productController = Get.put(ProductController());
  final _fromKey = GlobalKey<FormState>();
  int addData = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _fromKey,
                child: Column(
                  children: [
                    ValidatingTextField(
                        textController: _pNameController,
                        title: "Product Name",
                        validatorText: "Please,enter the product name."),
                    const SpaceVertical(10),
                    ValidatingTextField(
                        textController: _pDetailsController,
                        title: "Product Details",
                        validatorText: "Please,enter the product details."),
                    const SpaceVertical(10),
                    ValidatingTextField(
                        textController: _pPriceController,
                        title: "Product Price",
                        validatorText: "Please,enter the product price."),
                    const SpaceVertical(10),
                    ValidatingTextField(
                        textController: _pDiscountController,
                        title: "Discount",
                        validatorText: "Please,enter the product discount."),
                    const SpaceVertical(10),
                    ValidatingTextField(
                        textController: _pBrandController,
                        title: "Brand",
                        validatorText: "Please,enter the product brand."),
                    const SpaceVertical(10),
                    ValidatingTextField(
                        textController: _pQtyController,
                        title: "Quantity",
                        validatorText: "Please,enter the product quantity."),
                    const SpaceVertical(10),
                  ],
                )),
            addData == 0
                ? ElevatedButton(
                    onPressed: () {
                      String uid =
                          "${FirebaseAuth.instance.currentUser}${DateTime.now().millisecondsSinceEpoch}";
                      Stackdatum product = Stackdatum(
                          id: uid,
                          productName: _pNameController.text,
                          price: _pPriceController.text,
                          discount: _pDiscountController.text,
                          brand: _pBrandController.text,
                          quantityType: _pQtyController.text,
                          productDetails: _pDetailsController.text,
                          stackqty: _pQtyController.text as int);
                      productController.insertProduct(product);
                    },
                    child: const Text('Submit your product'),
                  )
                : const CircularProgressIndicator(),
          ]),
        ),
      ),
    );
  }
}
