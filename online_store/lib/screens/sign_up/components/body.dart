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
  String email, password, confirm_password;
  bool remember = false;
  final List<String> errors = [];
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
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (value.isNotEmpty &&
                  !emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
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
          ),
          TextFormField(
            // obscure visibility of the password
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kPassNullError)) {
                setState(() {
                  errors.remove(kPassNullError);
                });
              } else if (value.length >= 8 &&
                  errors.contains(kShortPassError)) {
                setState(() {
                  errors.remove(kShortPassError);
                });
              }
              // In case a user removed some characters below the threshold, show alert
              else if (value.length < 8 &&
                  value.isNotEmpty &&
                  !errors.contains(kShortPassError)) {
                setState(() {
                  errors.add(kShortPassError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kPassNullError)) {
                setState(() {
                  errors.add(kPassNullError);
                });
              } else if (value.length < 8 &&
                  value.isNotEmpty &&
                  !errors.contains(kShortPassError)) {
                setState(() {
                  errors.add(kShortPassError);
                });
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
