import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    this.validator,
    this.value,
    super.key,
    required this.list,
    required this.valueChanged,
  });
  final List<dynamic> list;
  final dynamic value;
  final void Function(dynamic)? valueChanged;
  final String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          value: value,
          hint: const Text(
            'Choose group',
            style: TextStyle(
              color: Color.fromARGB(255, 191, 121, 121),
              fontSize: 15,
            ),
          ),
          decoration: const InputDecoration(
            iconColor: Color.fromARGB(255, 191, 121, 121),
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 191, 121, 121),
              fontSize: 15,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 191, 121, 121), width: 3),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 191, 121, 121), width: 3),
            ),
            contentPadding: EdgeInsets.all(20),
          ),
          items: list.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
          style: const TextStyle(
            color: Color.fromARGB(255, 191, 121, 121),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          onChanged: valueChanged,
          validator: validator,
        ),
      ],
    );
  }
}
