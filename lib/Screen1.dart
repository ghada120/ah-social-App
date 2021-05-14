//import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
//import 'package:dots_indicator/dots_indicator.dart';
import 'Screen2.dart';
//....................
// dot indicator feature
//shadow box with el2b3ad
//....................

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          child: Screen1Page(),
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
  //Responsive
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Picture
        Container(
            width: screenWidth,
            height: screenHeight * 0.4803,
            child: Image.asset(
              "Image/Screen1.jpg",
            )),
        SizedBox(height: screenHeight * 0.0209),
        //Register Text
        Container(
          height: screenHeight * 0.0259,
          width: screenWidth * 0.152,
          child: Text(
            "Register",
            style: TextStyle(
              //fontFamily: 'GE SS Two',
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: screenHeight * 0.021,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.0222),
        //Long phrase Text
        Container(
          width: screenWidth * 0.672,
          height: screenHeight * 0.0234,
          child: Text(
            "Register now and connect with your friends",
            style: TextStyle(
              // fontFamily: 'GE SS Two',
              color: Color.fromRGBO(87, 93, 99, 1),
              fontSize: screenHeight * 0.018,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.07389),
        //Next Button
        Container(
          width: screenWidth * 0.453,
          height: screenHeight * 0.0493,
          child: RaisedButton(
            color: Color.fromRGBO(0, 0, 0, 1),
            splashColor: Colors.black,
            onPressed: () => _jump(context),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.15,
                ),
                Text(
                  'Next',
                  style: TextStyle(
                    //light
                    //fontFamily: 'GE SS Two',
                    fontSize: screenHeight * 0.021,
                    color: Colors.white,
                  ),
                ),
                //25pixels
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Icon(
                  Icons.chevron_right,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.053),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.0271),
        //Dot indicator
        Container(
          height: screenHeight * 0.0086,
          width: screenWidth * 0.0918,
          child: Image.asset("Image/dot-1.jpg"),
        ),
      ],
    );
  }

//JUMP TO  St-SCREEN 2
  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Screen2()),
        (Route<dynamic> route) => false);
  }
}
