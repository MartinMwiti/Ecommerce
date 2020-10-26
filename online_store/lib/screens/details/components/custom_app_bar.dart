import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/components/rounded_icon_btn.dart';
import 'package:online_store/size_config.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar(this.rating);
  // PreferredSize - This widget does not impose any constraints on its child, and it doesn't affect the child's layout in any way. It just advertises a preferred size which can be used by the parent.
  @override
  // AppBar().preferredSize.height provide us with the height that apply on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  // Creates a [Size] with the given [height] and an infinite [width]. - Creates a [Size] with the given [height] and an infinite [width].

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(
              iconData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/Star Icon.svg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}