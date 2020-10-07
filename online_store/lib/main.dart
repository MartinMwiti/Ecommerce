import 'package:flutter/material.dart';
import 'package:online_store/routes.dart';
import 'package:online_store/screens/splash/splash_screen.dart';
import 'package:online_store/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: theme(),
      // We use routeName so that we don't neet to remember the name
      initialRoute: SplashScreen.routeName, // "/splash"
      routes:
          routes, // When navigating to the "/splash" route, build the SplashScreen widget.
    );
  }
}

