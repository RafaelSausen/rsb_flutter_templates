import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsb_flutter_templates/modules/login/components/build_email_textfield.dart';
import 'package:rsb_flutter_templates/modules/login/components/build_password_textfield.dart';
import 'package:rsb_flutter_templates/modules/login/controller/login.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_button.dart';
import 'package:rsb_flutter_templates/shared/constants/theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controllers
  final formKey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _password = TextEditingController();
  final Key loginButtonKey = const Key('loginButton');

  RSBButton _buildLoginButton(BuildContext context) {
    return RSBButton(
      key: loginButtonKey,
      iconStart: Icons.login,
      text: "ENTER",
      onPressed: () => login(context, _user, _password),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/forgotPassword',
            ),
            child: const Text(
              'Forgot password?',
              style: kLabelTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSignupButton() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/signup',
      ),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account? Sign up',
              style: kLabelTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Form(
          key: formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 200.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildEmailTF(_user),
                    buildPasswordTF(_password),
                    _buildForgotPasswordButton(),
                    _buildLoginButton(context),
                    _buildSignupButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
