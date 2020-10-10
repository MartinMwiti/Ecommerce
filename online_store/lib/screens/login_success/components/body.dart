import 'package:flutter/material.dart';
import 'package:online_store/components/default_button.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.49,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.07),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.09),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to home",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}
