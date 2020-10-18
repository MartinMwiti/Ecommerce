import 'package:flutter/material.dart';
import 'package:online_store/constants.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text("OTP Verification", style: headingStyle),
            Text("We sent your code to +254 711 *** ***"),
            buildTimer(),
            OtpForm()
          ],
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

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(55),
            child: TextFormField(
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
