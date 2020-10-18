import 'package:flutter/material.dart';
import 'package:online_store/routes.dart';
import 'package:online_store/screens/splash/splash_screen.dart';
import 'package:online_store/theme.dart';

// import 'package:device_preview/device_preview.dart';

void main() {
  runApp(MyApp());
}

// // Preview layout on different Phones - TESTING PHASE
// void main() => runApp(
//   DevicePreview(
//     enabled: true,
//     builder: (context) => MyApp(),
//   ),
// );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // // Properties for Device preview - TESTING PHASE
      // locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      // builder: DevicePreview.appBuilder, // <--- /!\ Add the builder

      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: theme(),
      // We use routeName so that we don't neet to remember the name
      initialRoute: SplashScreen.routeName, // "/splash"
      routes: routes, // When navigating to the "/splash" route, build the SplashScreen widget.
    );
  }
}

