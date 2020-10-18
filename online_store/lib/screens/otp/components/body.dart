import 'package:flutter/material.dart';
import 'package:online_store/constants.dart';
import 'package:online_store/screens/otp/components/otp_form.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05), // 5%
              Text("OTP Verification", style: headingStyle),
              Text("We sent your code to +254 711 *** ***"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15), // 15%
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1), // 10%
              GestureDetector(
                onTap: () {
                  // resend your OTP
                },
                child: Text(
                  "Resend OTP code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expire in "),
        // The TweenAnimationBuilder takes full ownership of the provided Tween and it will mutate the Tween.
        TweenAnimationBuilder(
          // The tween defines the target value for the animation: When the widget first builds, it animates from Tween.begin to Tween.end.
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30), // because we allow users 30s
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          // A provided onEnd callback is called whenever an animation completes. Registering an onEnd callback my be useful to trigger an action (like another animation) at the end of the current animation.
          onEnd: () {},
        )
      ],
    );
  }
}
