import 'package:flutter/material.dart';
import 'package:gpst_app/Login.dart';
//.......................................
//shadow of Raised Buttton and its size
//.......................................

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          child: SignUpPage(),
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

enum AuthMode { SignUp }

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _emailSignupTextField = GlobalKey();
  final GlobalKey<FormState> _passwordSignupTextfield = GlobalKey();
  final GlobalKey<FormState> _confirmPasswordSignupTextfield = GlobalKey();
  final GlobalKey<FormState> _nameSignupTextfield = GlobalKey();
  final GlobalKey<FormState> _addressSignupTextfield = GlobalKey();
  final GlobalKey<FormState> _ageSignupTextfield = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'Confirm password': '',
    'Name': '',
    'Address': '',
    'Age': '',
  };
  final _passwordController = TextEditingController();
  bool passwordVisiable = true;
  double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Space
          Container(
            height: screenHeight * 0.0739,
            width: screenWidth,
          ),
          //SignUp text
          Container(
            height: screenHeight * 0.0456,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.02),
                Text(
                  "  Sign Up",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.0345,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.0135),
          //Email Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  "Email",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.0222,
                  ),
                ),
              ],
            ),
          ),
          //Email Field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _emailSignupTextField,
              child: Card(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.0123,
                    horizontal: screenWidth * 0.067),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.006),
                  side: BorderSide(
                    width: screenWidth * 0.002,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Email",
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.0197,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val.isEmpty || !val.contains("@")) {
                      return "please enter a valid email address";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['email'] = val;
                    print(_authData['email']);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.027),
          //Password Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  "Password",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.0222,
                  ),
                ),
              ],
            ),
          ),
          //Password Field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _passwordSignupTextfield,
              child: Card(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.0123,
                    horizontal: screenWidth * 0.067),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.006),
                  side: BorderSide(
                    width: screenWidth * 0.002,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your password",
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.0197,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: IconButton(
                        icon: Icon(passwordVisiable
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisiable = !passwordVisiable;
                          });
                        }),
                  ),
                  controller: _passwordController,
                  obscureText: !passwordVisiable,
                  validator: (val) {
                    if (val.isEmpty || val.length < 7) {
                      return " Password must be at least 7 characters ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['password'] = val;
                    print(_authData['password']);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.0135),
          //Confirm Paasword Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.0222,
                  ),
                ),
              ],
            ),
          ),
          //Confirm Paasword field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _confirmPasswordSignupTextfield,
              child: Card(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.0123,
                    horizontal: screenWidth * 0.067),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.006),
                  side: BorderSide(
                    width: screenWidth * 0.002,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your password",
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.0197,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: IconButton(
                        icon: Icon(passwordVisiable
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisiable = !passwordVisiable;
                          });
                        }),
                  ),
                  controller: _passwordController,
                  obscureText: !passwordVisiable,
                  validator: (val) {
                    if (val.isEmpty || val.length < 7) {
                      return " Password must be at least 7 characters ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['Confirm password'] = val;
                    print(_authData['Confirm password']);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.0135),
          //Name Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  "Name",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.0222,
                  ),
                ),
              ],
            ),
          ),
          //Name Field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _nameSignupTextfield,
              child: Card(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.0123,
                    horizontal: screenWidth * 0.067),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.006),
                  side: BorderSide(
                    width: screenWidth * 0.002,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Name",
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.0197,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "please enter your Name";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['Name'] = val;
                    print(_authData['Name']);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.0135),
          //Address Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  "Address",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.0222,
                  ),
                ),
              ],
            ),
          ),
          //Address Field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _addressSignupTextfield,
              child: Card(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.0123,
                    horizontal: screenWidth * 0.067),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.006),
                  side: BorderSide(
                    width: screenWidth * 0.002,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Address",
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.0197,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "please enter a valid  address";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['Address'] = val;
                    print(_authData['Address']);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.0135),
          //Age Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  "Age",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.0222,
                  ),
                ),
              ],
            ),
          ),
          //Age field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _ageSignupTextfield,
              child: Card(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.0123,
                    horizontal: screenWidth * 0.067),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.006),
                  side: BorderSide(
                    width: screenWidth * 0.002,
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Age",
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: screenHeight * 0.0197,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "please enter your Age";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _authData['Age'] = val;
                    print(_authData['Age']);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.0333),
          //SignUp Button
          RaisedButton(
            color: Color.fromRGBO(0, 0, 0, 1),
            //splashColor: Colors.red,
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: screenHeight * 0.0197,
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenHeight * 0.0369),
            ),
            //90 18
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.2, vertical: screenHeight * 0.022),
            onPressed: _submit,
          ),
          SizedBox(height: screenHeight * 0.02216),
          //I've already...Button
          Container(
            height: screenHeight * 0.0233,
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () => _jump(context),
                  child: Text(
                    "I already have an account",
                    style: TextStyle(
                      //Deafult font
                      color: Color.fromRGBO(87, 93, 99, 1),
                      fontSize: screenHeight * 0.017,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Space
          Container(
            height: screenHeight * 0.0628,
            width: screenWidth,
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (!_emailSignupTextField.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_passwordSignupTextfield.currentState.validate()) {
      return;
    }
    ;
    if (!_confirmPasswordSignupTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_nameSignupTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_addressSignupTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_ageSignupTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    _emailSignupTextField.currentState.save();
    _passwordSignupTextfield.currentState.save();
    _confirmPasswordSignupTextfield.currentState.save();
    _nameSignupTextfield.currentState.save();
    _addressSignupTextfield.currentState.save();
    _ageSignupTextfield.currentState.save();
  }

  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return MyLogin();
      }),
    );
  }
}
