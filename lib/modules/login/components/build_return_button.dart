import 'package:flutter/material.dart';

import '../../../shared/constants/theme.dart';

Widget buildReturnButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Return to login.',
            style: kLabelTextStyle,
          ),
        ],
      ),
    ),
  );
}