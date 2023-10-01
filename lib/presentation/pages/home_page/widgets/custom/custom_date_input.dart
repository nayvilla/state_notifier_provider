import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

Widget customDateInput(String labelText, String hintText, String? selectedDate, ValueChanged<String?> onChanged) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 800,
      ),
      child: DateTimePicker(
        type: DateTimePickerType.date,
        dateMask: 'yyyy-MM-dd',
        initialValue: selectedDate ?? DateTime.now().toString(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        icon: const Icon(Icons.event),
        dateLabelText: labelText,
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
