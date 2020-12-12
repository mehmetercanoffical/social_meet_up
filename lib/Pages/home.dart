import 'package:flutter/material.dart';
import 'package:social_meet_up/services/authController.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await AuthController().exitEmailAndPassword();
            }),
      )),
    );
  }
}
