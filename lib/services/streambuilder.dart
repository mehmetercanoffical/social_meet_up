import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_meet_up/Modals/users.dart';
import 'package:social_meet_up/Pages/home.dart';
import 'package:social_meet_up/auth/firtspage.dart';
import 'package:social_meet_up/services/authController.dart';

class StreamGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthController().authchanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasData) {
            Users activeuser = snapshot.data;
            AuthController().activeUserId = activeuser.id;
            return Home();
          } else {
            return FirtsPage();
          }
        });
  }
}
