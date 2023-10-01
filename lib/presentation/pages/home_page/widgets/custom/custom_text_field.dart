import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextField(String labelText, String hintText, int maxLength, {bool obscureText = false, double customWidth = double.infinity, TextEditingController? controller, ValueChanged<String>? onChanged,}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: customWidth,
      constraints: const BoxConstraints(
        maxWidth: 800,
      ),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        ),
      ),
    ),
  );
}

Widget customNumericTextField(String labelText, String hintText, int maxLength, {bool obscureText = false, double customWidth = double.infinity, TextEditingController? controller, ValueChanged<String>? onChanged, TextStyle? style,}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: customWidth,
      constraints: const BoxConstraints(
        maxWidth: 800,
      ),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true), // Teclado numérico
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')), // Permite números con hasta 2 decimales
        ],
        maxLength: maxLength,
        obscureText: obscureText,
        onChanged: onChanged,
        style: style,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        ),
      ),
    ),
  );
}