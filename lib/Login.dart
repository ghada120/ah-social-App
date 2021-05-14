import 'package:flutter/material.dart';
import 'SignUp.dart';
//..........................................
//Space between Don't have and signUp now!
//shadow of Raised Buttton and its size
//..........................................

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum AuthMode { Login }

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _emailLoginTextfield = GlobalKey();
  final GlobalKey<FormState> _passwordLoginTextfield = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
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
          //white Space
          Container(
            height: screenHeight * 0.2709,
            width: screenWidth,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          //Login Text
          Container(
            height: screenHeight * 0.0456,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.060,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    //use deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.034,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.043),
          //Email Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
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
              key: _emailLoginTextfield,
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
                      contentPadding: const EdgeInsets.all(20)),
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
          SizedBox(height: screenHeight * 0.02),
          //Password Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
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
              key: _passwordLoginTextfield,
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
          SizedBox(height: screenHeight * 0.0493),
          //Login Button
          RaisedButton(
            color: Color.fromRGBO(0, 0, 0, 1),
            child: Text(
              "Login",
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
          SizedBox(
            height: screenHeight * 0.02216,
          ),
          //Don't have an ....& Sign Up now Button
          Container(
            height: screenHeight * 0.0233,
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(87, 93, 99, 1),
                    fontSize: screenHeight * 0.017,
                  ),
                ),
                FlatButton(
                  onPressed: () => _jump(context),
                  child: Text(
                    "Sign Up now!",
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
            height: screenHeight * 0.2635,
            width: screenWidth,
          ),
        ],
      ),
    );
  }

//TODO:TRY TO MINIMIZE
  void _submit() {
    if (!_emailLoginTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_passwordLoginTextfield.currentState.validate()) {
      return;
    }
    ;
    _emailLoginTextfield.currentState.save();
    _passwordLoginTextfield.currentState.save();
  }

  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return SignUp();
      }),
    );
  }
}
