import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
          child: (Text(
        "My profile",
        style: TextStyle(
            fontSize: 20, color: Colors.black, backgroundColor: Colors.white),
      ))),
    );
  }
}
