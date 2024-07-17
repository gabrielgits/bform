import 'package:flutter/material.dart';

class BformTextInput extends StatelessWidget {
  final String label;
  final String? prefixText;
  final String? errorText;
  final double fontSize;
  final ValueChanged<String>? onChange;
  final TextInputType? textInputType;
  final Icon? icon;
  final String? defaultValue;
  final bool? obscureText;
  final bool readOnly;
  final String? hintText;
  final TextEditingController? controller;

  const BformTextInput({
    Key? key,
    required this.label,
    this.prefixText,
    this.fontSize = 14,
    this.onChange,
    this.textInputType,
    this.icon,
    this.defaultValue,
    this.obscureText,
    this.controller,
    this.errorText,
    this.hintText,
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
      readOnly: readOnly,
      style: TextStyle(fontSize: fontSize),
      decoration: decoration(),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      labelText: label,
      hintText: hintText ?? 'Enter $label',
      prefixText: prefixText,
      errorText: errorText,
      prefixIcon: icon ?? const Icon(Icons.keyboard),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
