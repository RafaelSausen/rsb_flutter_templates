import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsb_flutter_templates/modules/login/components/build_email_textfield.dart';
import 'package:rsb_flutter_templates/modules/login/components/build_password_textfield.dart';
import 'package:rsb_flutter_templates/modules/login/components/build_return_button.dart';
import 'package:rsb_flutter_templates/modules/login/controller/register.dart';
import 'package:rsb_flutter_templates/modules/login/helpers/validations.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  // Controllers
  final formKey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _password = TextEditingController();

  Widget _buildSignUpButton() {
    return RSBButton(
      text: 'CREATE ACCOUNT',
      iconStart: Icons.check,
      onPressed: () {
        validateAndRegister();
      },
    );
  }

  void validateAndRegister() {
    if (formKey.currentState!.validate()) {
      if (isValid(context, _user, password: _password)) {
        register(context, _user, _password);
      }
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
                    buildPasswordTF(_password),
                    _buildSignUpButton(),
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
