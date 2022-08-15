import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsb_flutter_templates/modules/login/services/auth_service.dart';

void logout(BuildContext context) {
  context.read<AuthService>().logout();
}