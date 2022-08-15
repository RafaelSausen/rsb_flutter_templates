import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsb_flutter_templates/modules/login/services/auth_service.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_snack_bar.dart';

resetPassword(
    BuildContext context, TextEditingController user, bool mounted) async {
  try {
    await context.read<AuthService>().resetPassword(user.text);
    RSBSnackBar().show(
      context: context,
      message:
          "An email to recover your account has been sent. Check your email.",
      color: Colors.blue,
    );
    if (!mounted) return;
    Navigator.pop(context);
  } on AuthException catch (e) {
    RSBSnackBar().show(context: context, message: e.message);
  }
}
