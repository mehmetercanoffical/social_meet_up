import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_meet_up/auth/singinandup.dart';

class FirtsPage extends StatefulWidget {
  @override
  _FirtsPageState createState() => _FirtsPageState();
}

class _FirtsPageState extends State<FirtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/img/firstpage.png"),
        )),
        child: Container(
          //alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Welcome\n to Meet Up",
                textAlign: TextAlign.center,
                style: textstyle(sizeFont: 32),
              ),
              SizedBox(height: 5),
              Text(
                "The best way to meet people and try\n new activities. Let’s get started!",
                textAlign: TextAlign.center,
                style: textstyle(sizeFont: 15),
              ),
              SizedBox(height: 40),
              Text("CONTINUE WITH:", style: textstyle(sizeFont: 17)),
              SizedBox(height: 15),
              ButtonKey(
                  color: Color(0xff8a56ac),
                  text: "Email",
                  press: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SingInAndSingUp()));
                  }),
              SizedBox(height: 10),
              ButtonKey(color: Color(0xffD47FA6), text: "Google", press: () {}),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textstyle({double sizeFont}) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
      fontSize: sizeFont,
      color: Color(0xffffffff),
    );
  }
}

class ButtonKey extends StatelessWidget {
  TextStyle textstyle({double sizeFont}) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
      fontSize: sizeFont,
      color: Color(0xffffffff),
    );
  }

  const ButtonKey({
    Key key,
    @required this.color,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final Color color;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Material(
        borderRadius: BorderRadius.circular(40.00),
        child: InkWell(
          onTap: press,
          child: Container(
            alignment: Alignment.center,
            height: 52.00,
            width: 327.00,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40.00),
            ),
            child: Text(text, style: textstyle(sizeFont: 17)),
          ),
        ),
      ),
    );
  }
}
