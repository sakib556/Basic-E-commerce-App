import 'package:flutter/material.dart';

class ValidatingTextField extends StatelessWidget {
  const ValidatingTextField(
      {Key? key,
      required this.textController,
      required this.title,
      required this.validatorText})
      : super(key: key);
  final TextEditingController textController;
  final String title;
  final String validatorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return validatorText;
        } else {
          return null;
        }
      },
    );
  }
}
