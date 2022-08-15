import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsb_flutter_templates/modules/login/components/build_email_textfield.dart';
import 'package:rsb_flutter_templates/modules/login/components/build_return_button.dart';
import 'package:rsb_flutter_templates/modules/login/controller/reset_password.dart';
import 'package:rsb_flutter_templates/modules/login/helpers/validations.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  // Controllers
  final formKey = GlobalKey<FormState>();
  final _user = TextEditingController();

  RSBButton _buildResetPasswordButton(BuildContext context) {
    return RSBButton(
      text: "RECOVER ACCOUNT",
      iconStart: Icons.check,
      onPressed: () => validateAndResetPassword(context),
    );
  }

  void validateAndResetPassword(BuildContext context) {
    if (isValid(context, _user)) {
      resetPassword(context, _user, mounted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Form(
          key: formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 200.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildEmailTF(_user),
                    _buildResetPasswordButton(context),
                    buildReturnButton(context),
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
