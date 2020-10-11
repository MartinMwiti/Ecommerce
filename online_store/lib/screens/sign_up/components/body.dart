import 'package:flutter/material.dart';
import 'package:online_store/components/custom_suffix_icon.dart';
import 'package:online_store/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Register Account",
            style: headingStyle,
          ),
          Text(
            "Complete your details or continue \nwith social media.",
            textAlign: TextAlign.center,
          ),
          SignUpForm()
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // GlobalKey This uniquely identifies the Form , and allows validation of the form in a later step.
  final _formKey = GlobalKey<FormState>();
  String email, password, confirmPassword;
  bool remember = false;
  final List<String> errors = [];

  // func with named parameter
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            // Requests a keyboard with ready access to the "@" and "." keys.
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              } else if (value.isNotEmpty &&
                  !emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return null;
              }
            },
            validator: (value) {
              if (value.isEmpty) {
                addError(error: kEmailNullError);
                removeError(error: kInvalidEmailError);
              } else if (value.isNotEmpty &&
                  !emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
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
          ),
          TextFormField(
            // obscure visibility of the password
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kPassNullError)) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              // In case a user removed some characters below the threshold, show alert
              else if (value.length < 8 && value.isNotEmpty) {
                addError(error: kShortPassError);
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty) {
                addError(error: kPassNullError);
                removeError(error: kShortPassError);
              } else if (value.length < 8 && value.isNotEmpty) {
                addError(error: kShortPassError);
              }
              return null;
            },
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
          ),
        ],
      ),
    );
  }
}
