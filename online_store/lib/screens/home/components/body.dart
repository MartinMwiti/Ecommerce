import 'package:flutter/material.dart';
import 'package:online_store/screens/home/components/categories.dart';
import 'package:online_store/screens/home/components/discount_banner.dart';
import 'package:online_store/screens/home/components/home_header.dart';
import 'package:online_store/screens/home/components/special_offers.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SpecialOffers()
          ],
        ),
      ),
    );
  }
}

