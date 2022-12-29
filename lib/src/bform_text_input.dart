import 'package:bform/src/utils/bform_appearance.dart';
import 'package:flutter/material.dart';

class BformTextInput extends StatelessWidget {
  final String title;
  final BformAppearance? appearance;
  final String? prefixText;
  final String? errorText;
  final double fontSize;
  final ValueChanged<String>? onChange;
  final TextInputType? textInputType;
  final Icon? icon;
  final String? defaultValue;
  final bool? obscureText;
  final TextEditingController? controller;

  const BformTextInput({
    Key? key,
    required this.title,
    this.appearance,
    this.prefixText,
    this.fontSize = 14,
    this.onChange,
    this.textInputType,
    this.icon,
    this.defaultValue,
    this.obscureText,
    this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      initialValue: defaultValue,
      keyboardType: textInputType,
      onChanged: onChange,
      controller: controller,
      style: TextStyle(fontSize: fontSize),
      decoration: decoration(),
    );
  }

  InputDecoration decoration() {
    //final myIcon = icon != null ? Icon(icon) : null;

    if (appearance == BformAppearance.soft) {
      return InputDecoration(
        hintText: title,
        prefixText: prefixText,
        errorText: errorText,
        suffixIcon: icon,
        border: InputBorder.none,
      );
    } else if (appearance == BformAppearance.business) {
      return InputDecoration(
        labelText: title,
        prefixText: prefixText,
        errorText: errorText,
        icon: icon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
      );
    } else if (appearance == BformAppearance.sky) {
      return InputDecoration(
        labelText: title,
        hintText: 'Enter $title',
        prefixText: prefixText,
        errorText: errorText,
        prefixIcon: icon ?? const Icon(Icons.keyboard),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      );
    }
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
