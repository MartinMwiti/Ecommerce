import 'package:flutter/material.dart';
import 'package:online_store/constants.dart';
import 'package:online_store/routes.dart';
import 'package:online_store/screens/splash/splash_screen.dart';

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

ThemeData theme() {
  return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(headline6: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18))
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}