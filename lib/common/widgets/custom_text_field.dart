import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? icon;
  final Widget? suffixIcon;

  const CustomTextField(
      {super.key,
      this.controller,
      this.keyboard,
      this.hintText,
      this.obscureText = false,
      this.validator,
      this.icon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: textTheme(context).titleSmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: colorScheme(context).onSecondary,
          decorationThickness: 0,
          decoration: TextDecoration.none
            ),
        controller: controller,
        keyboardType: keyboard,
        validator: validator,
        obscureText: obscureText,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textTheme(context).titleSmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: icon,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          errorStyle: textTheme(context).titleSmall?.copyWith(
            fontSize: 11,
            color: colorScheme(context).error,
            fontWeight: FontWeight.w400,
          ),

        ));
  }
}
