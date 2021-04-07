import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpst_app/Screen1.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Screen1()
    )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
        backgroundColor:Colors.yellow[400],
      body: Center(
        child: CircleAvatar(
          radius: 250,
          backgroundImage: AssetImage('Image/5.jpg'),
          backgroundColor: Colors.white,
        ),
      )
    );
  }
}
