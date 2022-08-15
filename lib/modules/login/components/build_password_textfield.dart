import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_text_field.dart';

Widget buildPasswordTF(TextEditingController password) {
  return RSBTextField(
    textEditingController: password,
    hintText: 'Enter your password',
    icon: Icons.lock_outline,
    isPassword: true,
  );
}