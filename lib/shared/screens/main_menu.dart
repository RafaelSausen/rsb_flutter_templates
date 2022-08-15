import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/modules/login/controller/logout.dart';
import 'package:rsb_flutter_templates/shared/configurations/globals.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  Text buildWelcome() => Text('Welcome, $userName');

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Welcome'),
          GestureDetector(
            child: const Icon(Icons.exit_to_app),
            onTap: () => logout(context),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildWelcome(),
    );
  }
}
