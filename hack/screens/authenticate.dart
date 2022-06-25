import 'package:flutter/material.dart';
import 'package:hack/screens/login_screen.dart';
import 'package:hack/screens/sign_up_screen.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;

  void toggleview() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers, prefer_const_constructors
    if (showSignin) {
      return LoginScreen(toggleview: toggleview);
    } else {
      return SignUpScreen(toggleview: toggleview);
    }
  }
}
