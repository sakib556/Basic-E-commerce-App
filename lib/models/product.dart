class Product {
    Product({
        required this.stackdata,
    });

    List<Stackdatum> stackdata;

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        stackdata: List<Stackdatum>.from(json["stackdata"].map((x) => Stackdatum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "stackdata": List<dynamic>.from(stackdata.map((x) => x.toMap())),
    };
}

class Stackdatum {
    Stackdatum({
        required this.id,
        required this.productName,
        required this.price,
        required this.discount,
        required this.brand,
        required this.quantityType,
        required this.productDetails,
        required this.stackqty,
    });

    String id;
    String productName;
    String price;
    String discount;
    String brand;
    String quantityType;
    String productDetails;
    int stackqty;

    factory Stackdatum.fromMap(Map<String, dynamic> json) => Stackdatum(
        id: json["id"],
        productName: json["product_name"],
        price: json["price"],
        discount: json["discount"],
        brand: json["brand"],
        quantityType: json["quantity_type"],
        productDetails: json["product_details"],
        stackqty: json["stackqty"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "product_name": productName,
        "price": price,
        "discount": discount,
        "brand": brand,
        "quantity_type": quantityType,
        "product_details": productDetails,
        "stackqty": stackqty,
    };
}
