import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsb_flutter_templates/modules/login/services/auth_service.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_snack_bar.dart';
import 'package:rsb_flutter_templates/shared/configurations/globals.dart';

login(BuildContext context, TextEditingController user, TextEditingController password) async {
  try {
    await context.read<AuthService>().login(
      user.text,
      password.text,
    );
    RSBSnackBar().show(
      context: context,
      message: "Welcome, $userName",
    );
  } on AuthException catch (e) {
    RSBSnackBar().show(
      context: context,
      message: e.message,
      color: Colors.red,
    );
  }
}