import 'package:flutter/material.dart';
import 'package:online_store/models/product.dart';
import 'package:online_store/screens/details/components/product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductImages(product: product);
  }
}

