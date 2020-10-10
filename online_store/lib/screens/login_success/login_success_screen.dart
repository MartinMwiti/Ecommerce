import 'package:flutter/material.dart';
import 'package:online_store/screens/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox(), // remove the back arrow key
        title: Text("Login Success"),
      ),
      body: Body()
    );
  }
}
