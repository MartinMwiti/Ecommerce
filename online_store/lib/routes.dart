import 'package:flutter/widgets.dart';
import 'package:online_store/screens/sign_in/sign_in_screen.dart';
import 'package:online_store/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(), // When navigating to the "/splash" route, build the SplashScreen widget.
  SignInScreen.routeName: (context) => SignInScreen(),
};
