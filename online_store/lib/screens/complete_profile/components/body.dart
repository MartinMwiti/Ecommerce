import 'package:flutter/material.dart';
import 'package:online_store/constants.dart';
import 'package:online_store/screens/complete_profile/components/complete_profile_form.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Complete Profile",
              style: headingStyle,
            ),
            Text(
              "Complete your details or continue \n with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03), // 3%
            CompleteProfileForm(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Text(
              "By continuing you confirm that you agree with our Term and Condition",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
