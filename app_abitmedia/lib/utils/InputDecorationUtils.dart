import 'package:flutter/material.dart';

class InputDecorationUtils {
  static InputDecoration buildInputDecoration(String labelText, IconData? iconData) {
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      labelText: labelText,
      suffixIcon: iconData != null ? Icon(iconData) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
    );
  }
}