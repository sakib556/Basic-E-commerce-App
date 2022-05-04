import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/views/pages/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ProductSell extends StatefulWidget {
  const ProductSell({Key? key}) : super(key: key);
  @override
  State<ProductSell> createState() => _ProductSellState();
}
class _ProductSellState extends State<ProductSell> {
  final ProductController productController = Get.put(ProductController());
  final _fromKey= GlobalKey<FormState>();
  var size,height,width;
  String? pname,pprice,pdiscount,pbrand,pqty,pdetails;
  String qty_type="gm"; int add_data=0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
              SizedBox(height: 10,),
              Center(
                child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _fromKey,
            child: SingleChildScrollView(
              child: Container(
                   height: height-70,
                   width: width-10,
                  child: Center(
                    child: ListView(
                      children: [
                      SizedBox(height: 10,),
                      productName(),
                      SizedBox(height: 10,),
                      productPrice(),
                      SizedBox(height: 10,),
                      productDiscount(),
                      SizedBox(height: 10,),
                      Container(
                            width: 10,
                            child: productQuantityType()),
                      SizedBox(height: 10,),
                      productQuantity(),
                      SizedBox(height: 10,),
                      productBrand(),
                      SizedBox(height: 10,),
                      productDetails()
                      ],),
                  ),
              ),
            )),
              ),
            add_data==0? ElevatedButton(
              onPressed: () {
                 InsertData();
                },
              child: Text('Submit your product'),
            ):CircularProgressIndicator(),
          ]
        ),
      ),
    );
  }
  Widget productName()=> TextFormField(
    onChanged: (value){
      setState(() {
        pname=value;
      });
    },
      decoration: InputDecoration(
        labelText: "Product Name",
        border: OutlineInputBorder(),
      ),
     validator: (value){
        if(value.toString().isEmpty){
          return "Please,enter the product name.";
        }
        else{
          return null;
        }
     },
      );
  Widget productPrice()=> TextFormField(
    onChanged: (value){
      setState(() {
        pprice=value;
      });
    },
    decoration: InputDecoration(
      labelText: "Sell Price",
      border: OutlineInputBorder(),
    ),
    validator: (value){
      if(value.toString().isEmpty){
        return "Please enter the price";
      }
      else{
        return null;
      }
    },
  );
  Widget productDiscount()=> TextFormField(
    onChanged: (value){
      setState(() {
        pdiscount=value;
      });
    },
    decoration: InputDecoration(
      labelText: "Discount",
      border: OutlineInputBorder(),
    ),
    validator: (value){
      if(value.toString().isEmpty){
        return "Please enter 0 or some discount";
      }
      else{
        return null;
      }
    },
  );
  List<String> items=["gm","kg","ltr","piece", "pkt","carton"];
  Widget productQuantityType()=> Container(
    margin: EdgeInsets.only(left: 10,right: 200),
    child: DropdownButtonFormField<String>(
      value: qty_type,
      icon: const Icon(Icons.arrow_downward),
      elevation: 6,
      style: const TextStyle(color: Colors.deepPurple),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:BorderSide(width: 2,color: Colors.black)
        ),
      ),

      onChanged: (String? newValue) {
        setState(() {
          qty_type = newValue!;
          print(qty_type);
        });
      },
      items: items
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
  Widget productQuantity()=> TextFormField(
    onChanged: (value){
      setState(() {
        pqty=value;
      });
    },
    decoration: InputDecoration(
      labelText: "Quantity",
      border: OutlineInputBorder(),
    ),
    validator: (value){
      if(value.toString().isEmpty){
        return "Please enter the quantity.";
      }
      else{
        return null;
      }
    },
  );
  Widget productBrand()=> TextFormField(
    onChanged: (value){
      setState(() {
        pbrand=value;
      });
    },
    decoration: InputDecoration(
      labelText: "Brand",
      border: OutlineInputBorder(),
    ),
    validator: (value){
      if(value.toString().isEmpty){
        return "Please enter 'none' or the brand";
      }
      else{
        return null;
      }
    },
  );
  Widget productDetails()=> TextFormField(
    onChanged: (value){
      setState(() {
        pdetails=value;
      });
    },
    decoration: InputDecoration(
      labelText: "Details",
      border: OutlineInputBorder(),
    ),
    validator: (value){
      if(value.toString().length<4){
        return "Please enter some details.";
      }
      else{
        return null;
      }
    },
  );

  Future<void> InsertData() async {
    setState(() {
      add_data=1;
    });
    String url="https://vaizans.com/PHP_API/add_sellers_product.php";
    await http.post(Uri.parse(url),body: {"pname":pname,"price":pprice,"discount":pdiscount,
      "brand":pbrand,"quantity":pqty,"quantity_type":qty_type,"product_details":pdetails});
    setState(() {
      add_data=0;
    });
    productController.isLoading.value;
    await productController.fetchProducts();
    Get.off(HomeScreen());
  }
}
