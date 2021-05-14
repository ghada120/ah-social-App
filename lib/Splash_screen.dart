import 'package:flutter/material.dart';
import 'package:gpst_app/Screen1.dart';

class MySplashScreen extends StatelessWidget {
  double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
    Future.delayed(Duration(seconds: 6)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Screen1()),
          (Route<dynamic> route) => false);
    });
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage("Image/Screen3.jpg"),
          radius: screenWidth * 0.667,
        ),
      ),
    );
  }
}
