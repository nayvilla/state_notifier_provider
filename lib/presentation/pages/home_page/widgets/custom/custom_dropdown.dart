import 'package:flutter/material.dart';

Widget customDropdown(String labelText, List<String> options, String selectedValue, ValueChanged<String?> onChanged) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 800),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
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
        value: selectedValue,
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
