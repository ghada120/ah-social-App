import 'package:flutter/material.dart';
import 'Screen3.dart';
//....................
// dot indicator feature
//shadow box with el2b3ad
//....................

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          child: Screen2Page(),
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
            "Image/Screen2.jpg",
          ),
        ),
        SizedBox(height: screenHeight * 0.0209),
        //Connect Text
        Container(
          height: screenHeight * 0.0259,
          width: screenWidth * 0.152,
          child: Text(
            "Connect",
            style: TextStyle(
              // fontFamily: 'Langar',
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: screenHeight * 0.02,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.0222),
        //Long phrase Text
        Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.0234,
          child: Text(
            "Connect with the world and your friends wherever they are",
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
          child: Image.asset("Image/dot-2.jpg"),
        ),
      ],
    );
  }

//JUMP TO  St-SCREEN 3
  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Screen3()),
        (Route<dynamic> route) => false);
  }
}
