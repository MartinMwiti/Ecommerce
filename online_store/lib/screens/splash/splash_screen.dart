import 'package:flutter/material.dart';
import 'package:online_store/screens/splash/components/body.dart';
import 'package:online_store/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it(init func found in SizeConfig class) on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
