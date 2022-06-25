import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hack/services/auth.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleview;
  const LoginScreen({Key? key,required this.toggleview}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String errorMessage = "";

  bool? remember_me = false;
  @override
  Widget build(BuildContext context) {
    void signIn(String email, String password) async {
      if (_formKey.currentState!.validate()) {
        try {
          dynamic result = await _auth.Signemailandpassword(email, password);
        } on FirebaseAuthException catch (error) {
          switch (error.code) {
            case "invalid-email":
              "Your email address appears to be malformed.";

              break;
            case "wrong-password":
              errorMessage = "Your password is wrong.";
              break;
            case "user-not-found":
              errorMessage = "User with this email doesn't exist.";
              break;
            case "user-disabled":
              errorMessage = "User with this email has been disabled.";
              break;
            case "too-many-requests":
              errorMessage = "Too many requests";
              break;
            case "operation-not-allowed":
              errorMessage =
                  "Signing in with Email and Password is not enabled.";
              break;
            default:
              errorMessage = "An undefined Error happened.";
          }
          Fluttertoast.showToast(msg: errorMessage);
          print(error.code);
        }
      }
    }

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
                    'Sign In',
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
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {
                            email = value;
                          }),
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your email',
                            hintStyle: const TextStyle(color: Colors.white54),
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
                        'Password',
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
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            } else {
                              return null;
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) => setState(() {
                            password = value;
                          }),
                          style: const TextStyle(color: Colors.white),
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
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Forgot Password Button Pressed'),
                      padding: const EdgeInsets.only(right: 0.0),
                      child: const Text('Forgot Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: remember_me,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  remember_me = value;
                                });
                              },
                            )),
                        const Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: ()async{
                        dynamic result = await _auth.Signemailandpassword(email, password);
                      },
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: const Color(0xFF527DAA),
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
                            text: 'Don\'t have an Account? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            )),
                        TextSpan(
                            text: 'Sign Up',
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
