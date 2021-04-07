import 'package:flutter/material.dart';
import 'package:gpst_app/Login.dart';
//import 'package:graduation_app/main.dart';


class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor:Colors.yellow[400],
      body: SafeArea(
        child:Screen3Page(),
      ),
      ),
    );
  }
}

class Screen3Page extends StatefulWidget {
  @override
  _Screen3PageState createState() => _Screen3PageState();
}

class _Screen3PageState extends State<Screen3Page> {
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
            "Start",
            style: TextStyle(
              fontFamily:'Langar',
              color: Colors.yellow[900],
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height:20),
          Text(
            "Start now and share your ideas and message with everyone",
            style: TextStyle(
              fontFamily:'Langar',
              color: Colors.yellow[900],
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 40),
          RaisedButton(
            color: Colors.yellow[900],
            child: Text(
              "Start  ",
              style: TextStyle(
                fontFamily:'Langar',
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
            return  MyLogin();
          }
      ),
    );
  }


}