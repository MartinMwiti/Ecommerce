import 'package:flutter/material.dart';
import 'package:online_store/models/product.dart';
import 'package:online_store/size_config.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // By default our background color is white
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: RoundedIconBtn(),
      ),
    );
  }
}

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key key,
    this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: FlatButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.white,
        onPressed: () {},
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

// We need to pass our product to our details screen
// And we use named route so we need to create an argument class that will recieve the specific product

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
