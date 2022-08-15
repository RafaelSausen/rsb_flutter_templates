import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/modules/login/screens/forgot_password.dart';
import 'package:rsb_flutter_templates/modules/login/screens/sign_up.dart';
import 'package:rsb_flutter_templates/modules/login/services/auth_check.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routeList = <String, WidgetBuilder>{
    '/home': (_) => const AuthCheck(),
    '/forgotPassword': (_) => const ForgotPasswordView(),
    '/signup': (_) => const SignUpView(),
  };

  static String initial = '/home';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}