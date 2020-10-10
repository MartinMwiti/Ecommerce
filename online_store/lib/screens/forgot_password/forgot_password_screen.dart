import 'package:flutter/material.dart';
import 'package:online_store/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
        ),
        body: Body());
  }
}
