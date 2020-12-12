import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_meet_up/auth/firtspage.dart';
import 'package:social_meet_up/services/authController.dart';

class SingInAndSingUp extends StatefulWidget {
  @override
  _SingInAndSingUpState createState() => _SingInAndSingUpState();
}

class _SingInAndSingUpState extends State<SingInAndSingUp>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  TabController tabController;
  String name, email, password;
  int activeUp;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //TextTheme textTheme = GoogleFonts.workSansTextTheme();
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.amber,
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            //indicatorWeight: 3,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: tabController.length > 0
                  ? Color(0xff8A56AC)
                  : Color(0xffD47FA6),
            ),
            controller: tabController,
            tabs: [
              Tab(child: Text("SING IN")),
              Tab(
                child: Text("SING UP"),
              ),
            ],
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : TabBarView(controller: tabController, children: [
                singIn(),
                singUp(),
              ]));
  }

  Widget singIn() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            TextFormFields(
              pressSave: (writeValue) {
                email = writeValue;
              },
              pressValue: (writeValue) {
                if (writeValue.isEmpty) {
                  return "You are not add email";
                } else if (!writeValue.contains("@")) {
                  return "you are not true email";
                }
                return null;
              },
              text: "Email",
              obstrue: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15),
            TextFormFields(
              pressSave: (writeValue) {
                password = writeValue;
              },
              pressValue: (writeValue) {
                if (writeValue.isEmpty) {
                  return "You are not password";
                } else if (writeValue.trim().length > 6) {
                  return "you are password 6";
                }
                return null;
              },
              text: "Password",
              obstrue: true,
              textInputType: TextInputType.visiblePassword,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(right: 40, top: 15),
                child: Text(
                  "Forget Password?",
                  textAlign: TextAlign.right,
                  style: textStyle(sizeFont: 18, color: Color(0xff8A56AC)),
                ),
              ),
            ),
            SizedBox(height: 25),
            ButtonKey(
                text: "Sing In", color: Color(0xff8A56AC), press: singInEmail),
            SizedBox(height: 20),
            Text(
              "OR",
              textAlign: TextAlign.center,
              style: textStyle(sizeFont: 18, color: Color(0xff8A56AC)),
            ),
            SizedBox(height: 15),
            ButtonKey(
                text: "Sing In With Google",
                color: Color(0xffD47FA6),
                press: () {}),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  singInEmail() async {
    // var authChanged = Provider.of<AuthController>(context, listen: false);
    if (formKey.currentState.validate()) {
      return "hata varrrrrr";
    }
  }

  singUpEmail() async {
    var authChanged = Provider.of<AuthController>(context, listen: false);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        isLoading = true;
      });
      try {
        return await authChanged.createEmailAndPassword(email, password);
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print(e.toString());
      }
    }
  }

  Widget singUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            TextFormFields(
              pressSave: (writeValue) {
                name = writeValue;
              },
              pressValue: (writeValue) {
                if (writeValue.isEmpty) {
                  return "You are not add name";
                } else if (writeValue.trim().length < 4) {
                  return "you are name 4 leght";
                }
                return null;
              },
              text: "name",
              obstrue: false,
              textInputType: TextInputType.visiblePassword,
            ),
            TextFormFields(
              pressSave: (writeValue) {
                email = writeValue;
              },
              pressValue: (writeValue) {
                if (writeValue.isEmpty) {
                  return "You are not add email";
                } else if (!writeValue.contains("@")) {
                  return "you are not true email";
                }
                return null;
              },
              text: "Email",
              obstrue: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15),
            TextFormFields(
              pressSave: (writeValue) {
                password = writeValue;
              },
              pressValue: (writeValue) {
                if (writeValue.isEmpty) {
                  return "You are not password";
                } else if (writeValue.trim().length < 6) {
                  return "you are password 6";
                }
                return null;
              },
              text: "Password",
              obstrue: true,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 25),
            ButtonKey(
                text: "Sing Up", color: Color(0xff8A56AC), press: singUpEmail),
            SizedBox(height: 10),
            Text(
              "OR",
              textAlign: TextAlign.center,
              style: textStyle(sizeFont: 18, color: Color(0xff8A56AC)),
            ),
            SizedBox(height: 15),
            ButtonKey(
                text: "Sing Up With Google",
                color: Color(0xffD47FA6),
                press: () {}),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget tabs({String title, Color color, Function pressShow}) {
    return Container(
      alignment: Alignment.center,
      height: 40.00,
      width: 90.00,
      decoration: BoxDecoration(
        color: Color(0xff8a56ac),
        borderRadius: BorderRadius.circular(30.00),
      ),
      child: Text(title, style: textStyle(color: Colors.white)),
    );
  }

  TextStyle textStyle({double sizeFont, Color color}) {
    return TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        fontSize: sizeFont,
        color: color);
  }
}

class TextFormFields extends StatelessWidget {
  final bool auto;
  final bool obstrue;
  final String text;
  final IconData iconData;
  final TextInputType textInputType;
  final Function pressValue;
  final Function pressSave;

  const TextFormFields(
      {Key key,
      this.pressValue,
      this.text,
      this.iconData,
      this.auto,
      this.textInputType,
      this.obstrue,
      this.pressSave})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 35, top: 10),
      child: TextFormField(
        keyboardType: textInputType,
        validator: pressValue,
        obscureText: obstrue,
        onSaved: pressSave,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff998FA2))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff998FA2))),
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          contentPadding: EdgeInsets.only(left: 15),
          hintText: text,
          hintStyle: hintText(),
        ),
      ),
    );
  }

  TextStyle hintText({double sizeFont, Color color}) {
    return TextStyle(
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xff241332).withOpacity(0.32),
    );
  }
}
