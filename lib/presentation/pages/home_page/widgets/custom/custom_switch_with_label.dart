import 'package:flutter/material.dart';

Widget customSwitchWithLabel(String labelText, bool isSwitchOn, ValueChanged<bool> onSwitchChanged) {
  return Padding(
    padding: const EdgeInsets.all(15),
  
  child: Container(
    padding: const EdgeInsets.all(15),
    color: Colors.grey[200],
    constraints: const BoxConstraints(
      maxWidth: 770,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
          child: Switch(
            value: isSwitchOn,
            trackColor: const MaterialStatePropertyAll<Color>(Color.fromARGB(255, 14, 61, 133)),
            thumbColor: const MaterialStatePropertyAll<Color>(Color.fromARGB(255, 252, 251, 251)),
            onChanged: onSwitchChanged,
          ),
        ),
      ],
    ),
    ),
  );
}

