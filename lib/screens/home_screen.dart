import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/GetSampleApi.dart';
import 'package:flutter_ecommerce/screens/product_sell.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int? getdata=0;
  List<Stackdata>? apilist;
  @override
  void initState() {
    GetApiData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size,height,width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title:const Text("Product List") ,
      ),
      body: Column(
        children: [
          Expanded(
           child: apilist!=null ? ListView.builder(
               itemCount:  apilist?.length,
               itemBuilder: (context,index){
                 return Card(
                   child: Container(
                       height: 150,
                       child: Row(children: [
                         SizedBox(width: 10,),
                         CircleAvatar(child: Icon(Icons.star,color: Colors.yellow,),),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             SizedBox(height: 10,),
                             Row(children: [SizedBox(width: 10,), Text("Product information")]),
                             Row(children: [SizedBox(width: 10,), Text("Product Id : ${apilist![index].id}")]),
                             Row(children: [SizedBox(width: 10,),Text("Product Name : ${apilist![index].productName}",style: TextStyle(fontWeight: FontWeight.bold),)]),
                             Row(children: [SizedBox(width: 10,),Text("Price : ${apilist![index].price}",style: TextStyle(fontWeight: FontWeight.bold)),]),
                             Row(children: [SizedBox(width: 10,),Text("Discount : ${apilist![index].discount}"),]),
                             Row(children: [SizedBox(width: 10,),Text("Brand : ${apilist![index].brand} "),]),
                             Row(children: [SizedBox(width: 10,),Text("Quantity : ${apilist![index].stackqty} ${apilist![index].quantityType}"),]),
                             Row(children: [SizedBox(width: 10,),Text("Details : ${apilist![index].productDetails}"),]),
                           ],
                         ),
                       ],)
                   ),
                 );
               }
           ) : Center(child: CircularProgressIndicator())
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text("Do you want to sell your product ?"),
            SizedBox(width: 10,),
            GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductSell(),));
            },
            child: CircleAvatar(
              child: Icon(Icons.add),),
          ),
            SizedBox(width: 15,)
            ],
          ),
          SizedBox(height: 10,)
        ],
      )
    );
  }
  Future<void> GetApiData() async {
    print("start api");
    print(" calling ...... ");
    String url="https://vaizans.com/PHP_API/show_sellers_product.php";
    var result = await http.get(Uri.parse(url));
    apilist=jsonDecode(result.body)['stackdata']
        .map((item)=>Stackdata.fromJson(item))
        .toList()
        .cast<Stackdata>();
   // print(apilist.toString());
    setState(() {
    });
  }
}
