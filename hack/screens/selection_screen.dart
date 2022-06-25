import 'package:flutter/material.dart';
import 'package:hack/screens/homepage.dart';



class Selection_Screen extends StatefulWidget {

  @override
  _Selection_ScreenState createState() => _Selection_ScreenState();
}

class _Selection_ScreenState extends State<Selection_Screen> {

  bool button_pressed_Ind=false;
  bool button_pressed_ab=false;
  bool button_pressed_com=false;
  bool button_pressed_med=false;
  bool button_pressed_eng=false;
  bool button_pressed_sci=false;
  bool button_pressed_soc=false;
  bool button_pressed_art=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(height: double.infinity, width:double.infinity, decoration: const BoxDecoration(
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
          ),),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Place of Study',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      children: [
                        const SizedBox(width: 20.0),
                        RaisedButton(
                            child: const Text(
                              'India',
                              style: TextStyle(
                                color: Color(0xFF527DAA),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_Ind? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_Ind=!button_pressed_Ind;
                              button_pressed_ab=false;
                            });
                          },
                        ),
                        const SizedBox(width: 50.0),
                        RaisedButton(
                          child: const Text(
                            'Abroad',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_ab? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_ab=!button_pressed_ab;
                              button_pressed_Ind=false;
                            });
                          },

                        )
                      ],
                    ),
                    const Divider(
                      thickness: 5.0,
                      height: 60.0,
                      color: Colors.black,
                    ),
                    const Text(
                      'Course of Study',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      children: [
                        RaisedButton(
                          child: const Text(
                            'Commerce',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_com? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_com=!button_pressed_com;
                              button_pressed_med=false;
                              button_pressed_eng=false;
                              button_pressed_sci=false;
                              button_pressed_soc=false;
                              button_pressed_art=false;
                            });
                          },
                        ),
                        const SizedBox(width: 49.0),
                        RaisedButton(
                          child: const Text(
                            'Medicine',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_med? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_com=false;
                              button_pressed_med=!button_pressed_med;
                              button_pressed_eng=false;
                              button_pressed_sci=false;
                              button_pressed_soc=false;
                              button_pressed_art=false;
                            });
                          },

                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        RaisedButton(
                          child: const Text(
                            'Engineering',
                            style: TextStyle(
                              color: const Color(0xFF527DAA),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_eng? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_eng=!button_pressed_eng;
                              button_pressed_med=false;
                              button_pressed_com=false;
                              button_pressed_sci=false;
                              button_pressed_soc=false;
                              button_pressed_art=false;
                            });
                          },
                        ),
                        const SizedBox(width: 51.0),
                        RaisedButton(
                          child: const Text(
                            'Science',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_sci? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_com=false;
                              button_pressed_med=false;
                              button_pressed_eng=false;
                              button_pressed_sci=!button_pressed_sci;
                              button_pressed_soc=false;
                              button_pressed_art=false;
                            });
                          },

                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        RaisedButton(
                          child: const Text(
                            'Social Sciences',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_soc? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_com=false;
                              button_pressed_med=false;
                              button_pressed_eng=false;
                              button_pressed_sci=false;
                              button_pressed_soc=!button_pressed_soc;
                              button_pressed_art=false;
                            });
                          },
                        ),
                        const SizedBox(width: 50.0),
                        RaisedButton(
                          child: const Text(
                            'Arts',
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: button_pressed_art? Colors.lightBlue: Colors.white,
                          onPressed: ()
                          {
                            setState(() {
                              button_pressed_com=false;
                              button_pressed_med=false;
                              button_pressed_eng=false;
                              button_pressed_sci=false;
                              button_pressed_soc=false;
                              button_pressed_art=!button_pressed_art;
                            });
                          },

                        )
                      ],
                    ),
                    const SizedBox(height: 30.0,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: (){
                          Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) =>  HomePage()));
                        },
                        padding: const EdgeInsets.all(14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: const Color(0xFF478DE0),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],)
    );
  }
}