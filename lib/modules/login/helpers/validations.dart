import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_snack_bar.dart';

bool isValid(BuildContext context, TextEditingController user,
    {TextEditingController? password}) {
  if (user.text.isEmpty) {
    RSBSnackBar().show(
      context: context,
      message: "Enter your login.",
      color: Colors.red,
    );
    return false;
  }
  if (password != null) {
    // The password was not sent to validations
    return true;
  }
  if (password!.text.isEmpty) {
    RSBSnackBar().show(
      context: context,
      message: "Enter your password.",
      color: Colors.red,
    );
    return false;
  }
  if (password.text.length < 6) {
    RSBSnackBar().show(
      context: context,
      message: "The password must be at least 6 characters long.",
      color: Colors.red,
    );
    return false;
  }
  return true;
}
