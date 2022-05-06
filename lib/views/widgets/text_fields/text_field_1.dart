import 'package:flutter/material.dart';
class TextField1 extends StatelessWidget {
  TextField1({this.label,this.hint});
  //final TextEditingController? controller;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle( color :Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: IconButton(icon: Icon(Icons.input), onPressed: () {  },)
      ),
    );
  }
}
