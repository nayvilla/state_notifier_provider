// ignore: file_names
import 'package:flutter/material.dart';


// ignore: non_constant_identifier_names
Widget CustomBuscadorTransacciones(String hintText, {TextEditingController? controller, ValueChanged<String>? onChanged, Icon? prefixIcon, VoidCallback? onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints(
          maxWidth: 380,
          maxHeight: 80,
        ),
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
            ),
            hintText: hintText,
            //prefixIcon: prefixIcon,
            suffixIcon: IconButton(
              onPressed: onPressed, // Agrega la función onPressed aquí
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    ),
  );
}

