import 'package:flutter/material.dart';
import 'Screen3.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.yellow[400],
      body: SafeArea(
        child:Screen2Page(),
      ),
      ),
    );
  }
}

class Screen2Page extends StatefulWidget {
  @override
  _Screen2PageState createState() => _Screen2PageState();
}

class _Screen2PageState extends State<Screen2Page> {
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
            "Connect",
            style: TextStyle(
              fontFamily:'Langar',
              color: Colors.yellow[900],
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height:20),
          Text(
            "Connect with the world and your friends wherever they are",
            style: TextStyle(
              fontFamily:'Langar',
              color: Colors.yellow[900],
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 40),
          RaisedButton(
            color: Colors.yellow[800],
            child: Text(
              "Next",
              style: TextStyle(
                fontFamily:'Langar',
                fontSize:18,
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal:90 ,vertical:18 ),
            onPressed:() =>_jump(context),
          ),
        ],
      ),
    );
  }
  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
          builder: (_){
            return Screen3 ();
          }
      ),
    );
  }
}
