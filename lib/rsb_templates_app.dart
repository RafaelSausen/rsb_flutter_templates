import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/modules/routes/routes.dart';
import 'package:rsb_flutter_templates/shared/constants/theme.dart';

class RSBTemplatesApp extends StatelessWidget {
  const RSBTemplatesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSB Flutter Templates',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      routes: Routes.routeList,
      initialRoute: Routes.initial,
    );
  }
}
