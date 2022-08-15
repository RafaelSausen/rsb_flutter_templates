import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/modules/login/screens/login.dart';
import 'package:rsb_flutter_templates/modules/login/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:rsb_flutter_templates/shared/components/progress_view.dart';
import 'package:rsb_flutter_templates/shared/configurations/globals.dart';
import 'package:rsb_flutter_templates/shared/screens/main_menu.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  fillUserVariables(AuthService auth) {
    if (auth.user!.displayName != '' && auth.user!.displayName != null) {
      userName = auth.user!.displayName.toString();
    } else {
      userName = auth.user!.email.toString();
    }
    userEmail = auth.user!.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    // Access the provider
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return const ProgressView(
        needScaffold: true,
      );
    } else if (auth.user == null) {
      // Isn't logged in
      return const LoginView();
    } else {
      // Is logged in
      if (!auth.user!.emailVerified) {
        return const LoginView();
      }
      fillUserVariables(auth);
      return const MainMenu();
    }
  }
}
