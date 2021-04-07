import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'Screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.yellow[400],
      body: SafeArea(
        child:Screen1Page(),
      ),
      ),
    );
  }
}

class Screen1Page extends StatefulWidget {
  @override
  _Screen1PageState createState() => _Screen1PageState();
}

class _Screen1PageState extends State<Screen1Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 180,

            backgroundColor: Colors.white,
          ),
          SizedBox(height: 40),
          Text(
            "Register",
            style: TextStyle(
              fontFamily:'Langar',
              color: Colors.yellow[900],
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height:20),
          Text(
            "Register now and connect with your friends",
            style: TextStyle(
              fontFamily:'Langar',
              color: Colors.yellow[900],
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 40),
          RaisedButton(
            color: Colors.yellow[800],
            onPressed: () =>_jump(context),
            child: Text(
              'Register',
              style: TextStyle(
                fontFamily:'Langar',
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal:90 ,vertical:18 ),
          ),
        ],
      ),
    );
  }

  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
          builder: (_){
            return Screen2 ();
          }
      ),
    );
  }
}