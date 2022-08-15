import 'package:flutter/material.dart';
import 'package:rsb_flutter_templates/shared/constants/theme.dart';

class RSBTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData? icon;
  final bool? isPassword;
  final IconData? suffixIcon;
  final Color? iconColor;
  final Decoration? decoration;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;

  const RSBTextField({
    required this.textEditingController,
    required this.hintText,
    this.icon,
    this.suffixIcon,
    this.isPassword,
    this.iconColor,
    this.decoration,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  State<RSBTextField> createState() => _RSBTextFieldState();
}

class _RSBTextFieldState extends State<RSBTextField> {
  // Initially password is obscure
  bool _obscureText = true;
  IconData passwordIcon = Icons.visibility;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText) {
        passwordIcon = Icons.visibility;
      } else {
        passwordIcon = Icons.visibility_off;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: widget.decoration ?? kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: widget.onChanged,
            controller: widget.textEditingController,
            keyboardType: widget.keyboardType,
            obscureText:
                widget.isPassword == true ? _obscureText : widget.obscureText,
            style: kLabelTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                widget.icon,
                color: widget.iconColor ?? kIconColor,
              ),
              hintText: widget.hintText,
              hintStyle: kHintTextStyle,
              suffixIcon: widget.suffixIcon != null
                  ? Icon(
                      widget.suffixIcon,
                      color: widget.iconColor ?? kIconColor,
                    )
                  : widget.isPassword == true
                      ? GestureDetector(
                          onTap: _toggle,
                          child: Icon(
                            passwordIcon,
                            color: widget.iconColor ?? kIconColor,
                          ),
                        )
                      : null,
            ),
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}
