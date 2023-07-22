// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget DefaultTextFormField(
    {required TextEditingController controller,
    required TextInputType type,
    required String labelText,
    Function(String?)? onSubmit,
    Function(String?)? onChange,
    String? Function(String?)? validate,
    bool autoFocus = false,
    bool obscure = false,
    bool enabled = true,
    var label,
    Widget? prefix}) {
  return TextFormField(
    controller: controller,
    validator: validate,
    autofocus: autoFocus,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    enabled: enabled,
    obscureText: obscure,
    decoration: InputDecoration(
      labelText: labelText,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(width: 1)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(width: 1)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(width: 1)),
      prefixIcon: prefix,
    ),
  );
}
