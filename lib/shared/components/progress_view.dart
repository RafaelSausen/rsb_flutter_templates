import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/shared/constants/theme.dart';

class ProgressView extends StatelessWidget {
  final String message;
  final bool needScaffold;
  final Color valueColor;

  const ProgressView({
    Key? key,
    this.message = 'Loading',
    this.needScaffold = false,
    this.valueColor = kButtonColor,
  }) : super(key: key);

  Widget progressWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              valueColor,
            ),
          ),
          Text(message),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (needScaffold) {
      return Scaffold(
        body: progressWidget(),
      );
    }
    return progressWidget();
  }
}
