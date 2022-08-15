import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsb_flutter_templates/modules/login/services/auth_service.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_snack_bar.dart';

Future<bool> register(
  BuildContext context,
  TextEditingController user,
  TextEditingController password,
) async {
  try {
    await context.read<AuthService>().register(user.text, password.text);
    RSBSnackBar().show(
      context: context,
      message: "A confirmation email has been sent. Check your email.",
    );
    return true;
  } on AuthException catch (e) {
    RSBSnackBar().show(context: context, message: e.message);
    return false;
  }
}
