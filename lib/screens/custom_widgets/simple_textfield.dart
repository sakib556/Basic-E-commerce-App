import 'package:flutter/material.dart';
class TextField1 extends StatelessWidget {
  const TextField1({this.controller, this.label,this.hint,this.icon});
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          labelText: null == label ? '': label,
          hintText: null == hint ? '': hint,
          hintStyle: TextStyle( color :Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: null == icon ? null: Icon(icon)
      ),
    );
  }
}
