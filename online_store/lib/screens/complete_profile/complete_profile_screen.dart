import 'package:flutter/material.dart';
import 'package:online_store/screens/complete_profile/components/body.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = "/complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
