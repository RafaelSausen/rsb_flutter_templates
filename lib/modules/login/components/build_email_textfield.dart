import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/shared/components/rsb_text_field.dart';

Widget buildEmailTF(TextEditingController user) {
  return RSBTextField(
    keyboardType: TextInputType.emailAddress,
    textEditingController: user,
    hintText: 'Enter your email',
    icon: Icons.email_outlined,
  );
}