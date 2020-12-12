import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_meet_up/services/authController.dart';
import 'package:social_meet_up/services/streambuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AuthController(),
      child: MaterialApp(
        title: 'Social Meet Up',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.trochutTextTheme()),
        home: StreamGet(),
      ),
    );
  }
}
