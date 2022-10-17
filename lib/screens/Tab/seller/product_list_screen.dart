import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/screens/Tab/bottom_navbar_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_ecommerce/screens/custom_widgets/validating_textfield.dart';
import 'package:flutter_ecommerce/screens/custom_widgets/space_vertical.dart';
import 'package:http/http.dart' as http;

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
  final ProductController productController =
      Get.put(ProductController());
  final _fromKey = GlobalKey<FormState>();
  var size, height, width;
  String? pname, pprice, pdiscount, pbrand, pqty, pdetails;
  String qtyType = "gm";
  int addData = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
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
                   //   InsertData();
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
