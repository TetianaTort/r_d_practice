import 'package:flutter/material.dart';

class CusomTextField extends StatelessWidget {
  const CusomTextField({
    Key? key,
    required this.lable,
    required this.value,
    this.textInputAction,
    required this.valueChanged,
    this.validator,
  }) : super(key: key);
  final String? Function(String?)? validator;
  final String lable;
  final String? value;

  final Function(String) valueChanged;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 191, 121, 121),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 191, 121, 121), width: 3),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 191, 121, 121), width: 3),
        ),
        contentPadding: const EdgeInsets.all(10),
      ),
      onChanged: (value) {
        if (value != '') {
          valueChanged(value);
        }
      },
      onSaved: (value) {
        if (value != null) {
          valueChanged(value);
        }
      },
      validator: validator,
    );
  }
}
