import 'dart:convert';
List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str)['stackdata'].map((x) => Product.fromJson(x)));
String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Product {
  String? id;
  String? productName;
  String? price;
  String? discount;
  String? brand;
  String? quantityType;
  String? productDetails;
  int? stackqty;

  Product(
      {this.id,
        this.productName,
        this.price,
        this.discount,
        this.brand,
        this.quantityType,
        this.productDetails,
        this.stackqty});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    price = json['price'];
    discount = json['discount'];
    brand = json['brand'];
    quantityType = json['quantity_type'];
    productDetails = json['product_details'];
    stackqty = json['stackqty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['brand'] = this.brand;
    data['quantity_type'] = this.quantityType;
    data['product_details'] = this.productDetails;
    data['stackqty'] = this.stackqty;
    return data;
  }
}
