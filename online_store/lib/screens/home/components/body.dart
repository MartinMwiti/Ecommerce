import 'package:flutter/material.dart';
import 'package:online_store/screens/home/components/home_header.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader()
          ],
        ),
      ),
    );
  }
}
