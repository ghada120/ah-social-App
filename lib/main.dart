import 'package:flutter/material.dart';
import 'package:gpst_app/User_profile.dart';
import 'Edit_Profile.dart';
import 'Group_Names.dart';
//import 'Groups.dart';
import 'Splash_screen.dart';
import 'User_profile.dart';

void main() => runApp(EditProfile());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySplashScreen(),
    );
  }
}
