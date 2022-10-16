import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';
class ProductTile extends StatelessWidget {
  const ProductTile(this.product, {Key? key, required this.index}) : super(key: key);
  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 290,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                   // child: Image.asset("assets/images/product.jpg"),
                    child: Image.network("https://mir-s3-cdn-cf.behance.net/projects/404/40e864138787243.Y3JvcCwxNDcyLDExNTEsMCwyNQ.jpg"),
                  ),
                  const Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white38,
                        child: Icon(Icons.favorite_rounded),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.stackdata[index].productName,
                maxLines: 2,
                style:
                const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800,fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const[
                       Text(
                        "5",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              Text('৳${product.stackdata[index].price}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}