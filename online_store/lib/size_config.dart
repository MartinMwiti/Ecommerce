import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double appBarHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    appBarHeight = AppBar().preferredSize.height;
    // safeAreaHorizontal =
    //     _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    // safeAreaVertical =
    //     _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    orientation = _mediaQueryData.orientation;
    print(screenHeight);
    print(screenWidth);

  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375) * screenWidth;
}

// iPhone X, iPhone XS, iPhone 11 Pro Landscape Logical Resolution = 812 x 375 points
