import 'package:flutter/material.dart';
import 'package:online_store/components/default_button.dart';
import 'package:online_store/constants.dart';
import 'package:online_store/screens/sign_in/sign_in_screen.dart';
import 'package:online_store/screens/splash/components/splash_content.dart';
import 'package:online_store/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people conect with store \naround Kenya.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        // PageView - Creates a scrollable list that works page by page using widgets that are created on demand.
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                    // Extracted widget
                    image: splashData[index]["image"],
                    text: splashData[index]["text"]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length,
                          (index) =>
                              buildDot(index: index)), // Extracted method
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
                      },
                    ), // Extracted a widget
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: getProportionateScreenHeight(6),
      width: currentPage == index
          ? getProportionateScreenWidth(20)
          : getProportionateScreenWidth(6),
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
