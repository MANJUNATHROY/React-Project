import 'package:flutter/material.dart';
import 'package:hack/screens/selection_screen.dart';
import 'package:hack/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggleview;
  const SignUpScreen({Key? key, required this.toggleview}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _auth = AuthService();

    String email = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF39BAE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xFF6CA8F1),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 60.0,
                        child:  TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) => setState(() => email= value),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create Password',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xFF6CA8F1),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 60.0,
                        child: TextField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) => setState(() => password = value),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xFF6CA8F1),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 60.0,
                        child: const TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Enter the same Password',
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () async{
                        dynamic result = _auth.Registerwithemailpass(email, password);
                      },
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 2.0,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => widget.toggleview(),
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: 'Already Registered? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            )),
                        TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ))
                      ])),
                    ),
                  )
                ],
              )),
        ),
      ],
    ));
  }
}
