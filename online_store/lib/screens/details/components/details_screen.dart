import 'package:flutter/material.dart';
import 'package:online_store/models/product.dart';
import 'package:online_store/screens/details/components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      // By default our background color is white
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(arguments.product
          .rating), // By default, the appbar has size limits thus if adding say, padding, it's shape e.g leading icon is squized thus in need for a more flexible/custom appBar
    );
  }
}

// We need to pass our product to our details screen
// And we used named route so we need to create an argument class that will recieve the specific product

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
