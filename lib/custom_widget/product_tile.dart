import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white38,
                        child: Icon(Icons.favorite_rounded),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                product.productName.toString(),
                maxLines: 2,
                style:
                TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800,fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              // if (product.rating != null)
              Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
              SizedBox(height: 8),
              Text('৳${product.price}',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}