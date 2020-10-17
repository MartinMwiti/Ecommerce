import 'package:flutter/material.dart';
import 'package:online_store/components/social_card.dart';
import 'package:online_store/constants.dart';
import 'package:online_store/screens/sign_up/components/sign_up_form.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Register Account",
                  style: headingStyle,
                ),
                Text(
                  "Complete your details or continue \nwith social media.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03), // 3%
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  )
                ]),
                SizedBox(height: getProportionateScreenHeight(15)),
                Text(
                  "By continuing you confirm that you agree with our Term and Condition",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
