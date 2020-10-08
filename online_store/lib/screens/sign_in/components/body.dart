import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_store/components/custom_suffix_icon.dart';
import 'package:online_store/components/default_button.dart';
import 'package:online_store/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign In with your email and password \n or continue with social media.",
                textAlign: TextAlign.center,
              ),
              SignForm()
            ],
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  // GlobalKey This uniquely identifies the Form , and allows validation of the form in a later step.
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = ["Demo Error"];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // TextFormField - Creates a [FormField] that contains a [TextField].
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/Error.svg",
                // use same values to achieve proportionate size.
                height: getProportionateScreenWidth(14),
                width: getProportionateScreenWidth(14),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text(errors[0])
            ],
          ),
          DefaultButton(
            text: 'Continue',
            press: () {},
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      // obscure visibility of the password
      obscureText: true,
      decoration: InputDecoration(
        // uses the InputDecorationTheme defined in my theme.dart file
        labelText: "Password",
        hintText: "Enter your password",
        // When [FloatingLabelBehavior.always] the label will always float at the top of the field above the content.
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      // Requests a keyboard with ready access to the "@" and "." keys.
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            errors.add("Please enter your email");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        // uses the InputDecorationTheme defined in my theme.dart file
        labelText: "Email",
        hintText: "Enter your email",
        // When [FloatingLabelBehavior.always] the label will always float at the top of the field above the content.
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
