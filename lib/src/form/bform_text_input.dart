import 'package:flutter/material.dart';

class BformTextInput extends StatelessWidget {
  final String title;
  final String? prefixText;
  final String? errorText;
  final double fontSize;
  final ValueChanged<String>? onChange;
  final TextInputType? textInputType;
  final Icon? icon;
  final String? defaultValue;
  final bool? obscureText;
  final bool readOnly;
  final TextEditingController? controller;

  const BformTextInput({
    Key? key,
    required this.title,
    this.prefixText,
    this.fontSize = 14,
    this.onChange,
    this.textInputType,
    this.icon,
    this.defaultValue,
    this.obscureText,
    this.controller,
    this.errorText,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      initialValue: defaultValue,
      keyboardType: textInputType,
      onChanged: onChange,
      controller: controller,
      readOnly: false,
      style: TextStyle(fontSize: fontSize),
      decoration: decoration(),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      labelText: title,
      hintText: 'Enter $title',
      prefixText: prefixText,
      errorText: errorText,
      prefixIcon: icon ?? const Icon(Icons.keyboard),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
