import 'package:flutter/material.dart';
import 'package:online_store/components/custom_suffix_icon.dart';
import 'package:online_store/components/default_button.dart';
import 'package:online_store/components/form_error.dart';
import 'package:online_store/constants.dart';
import 'package:online_store/screens/complete_profile/complete_profile_screen.dart';
import 'package:online_store/size_config.dart';

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

  // func with named parameter for adding error
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  // func with named parameter for removing error
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
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // Go to complete profile page
                Navigator.pushNamed(context, CompleteProfile.routeName);
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  // CONFIRM PASSWORD FUNC
  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      // obscure visibility of the password
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value == password) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (value != password) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // uses the InputDecorationTheme defined in my theme.dart file
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // When [FloatingLabelBehavior.always] the label will always float at the top of the field above the content.
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  // PASSWORD FUNC
  TextFormField buildPasswordFormField() {
    return TextFormField(
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
        // we have to declare password to be used for verification by confirm password. We can't use the value of password in the state since it's empty until we save the form
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          removeError(error: kShortPassError);
          return "";
        } else if (value.length < 8 && value.isNotEmpty) {
          addError(error: kShortPassError);
          return "";
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
    );
  }

  // EMAIL FUNC
  TextFormField buildEmailFormField() {
    return TextFormField(
      // Requests a keyboard with ready access to the "@" and "." keys.
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        } else if (value.isNotEmpty && !emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return null;
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          removeError(error: kInvalidEmailError);
          return "";
        } else if (value.isNotEmpty && !emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
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
