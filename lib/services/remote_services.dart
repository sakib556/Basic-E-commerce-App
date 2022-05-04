import 'package:flutter_ecommerce/models/product.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
static var client=http.Client();

 static Future<List<Product>?> fetchProducts() async{
    String url="https://vaizans.com/PHP_API/show_sellers_product.php";
    var response = await client.get(Uri.parse(url));
    if(response.statusCode==200){
      var json_string = response.body;
      return productFromJson(json_string);
    }
    else{
      return null;
    }
  }

}