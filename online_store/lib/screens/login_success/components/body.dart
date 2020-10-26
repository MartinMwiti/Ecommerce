import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_store/screens/home/home_screen.dart';
import 'package:online_store/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void initState() {
    super.initState();
    startTimer();
  }

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
          // SizedBox(height: SizeConfig.screenHeight * 0.09),
          // SizedBox(
          //   width: SizeConfig.screenWidth * 0.6,
          //   child: DefaultButton(
          //     text: "Back to home",
          //     press: () {},
          //   ),
          // ),
        ],
      ),
    );
  }

  startTimer() async {
    Duration duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    // Navigator.pushReplacement - Replace the current route of the navigator that most tightly encloses the given context by pushing the given route and then disposing the previous route once the new route has finished animating in.
    Navigator.pushNamed(context, HomeScreen.routeName);
  }
}

// MaterialPageRoute - A modal route that replaces the entire screen with a platform-adaptive transition. For Android, the entrance transition for the page slides the route upwards and fades it in. The exit transition is the same, but in reverse.

// The transition is adaptive to the platform and on iOS, the route slides in from the right and exits in reverse. The route also shifts to the left in parallax when another page enters to cover it.
