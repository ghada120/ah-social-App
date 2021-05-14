import 'package:flutter/material.dart';
//......................................
//AppBar size no responsive
//wrap icon with container and text
//on press ..>action "INkwell"
//......................................

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(112, 112, 112, 1),
          title: Row(
            children: <Widget>[
              Icon(
                Icons.crop_portrait,
                size: 18,
              ),
              SizedBox(
                width: 28,
              ),
              Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: EditProfilePage(),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  double screenHeight, screenWidth;
  final GlobalKey<FormState> _emailEditProfileTextField = GlobalKey();
  final GlobalKey<FormState> _currentPasswordEditProfileTextfield = GlobalKey();
  final GlobalKey<FormState> _newPasswordEditProfileTextfield = GlobalKey();
  final GlobalKey<FormState> _nameEditProfileTextfield = GlobalKey();
  final GlobalKey<FormState> _addressEditProfileTextfield = GlobalKey();
  final GlobalKey<FormState> _ageEditProfileTextfield = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'Current password': '',
    'New password': '',
    'Name': '',
    'Address': '',
    'Age': '',
  };
  final _passwordController = TextEditingController();
  bool passwordVisiable = true;

  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: screenHeight * 0.0375),
          //PP Text
          Container(
            height: screenHeight * 0.02,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  'Profile Photo',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //PP
          Container(
            width: screenWidth * 0.8746,
            height: screenHeight * 0.1933,
            child: Image.asset("Image/try1.jpg", fit: BoxFit.fill),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.004),
            ),
            //TODO: USER IMAGE
          ),
          SizedBox(height: screenHeight * 0.0234),
          //Cover photo Text
          Container(
            height: screenHeight * 0.02,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.064),
                Text(
                  'Cover Photo',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //Cover photo
          Container(
            width: screenWidth * 0.8746,
            height: screenHeight * 0.1933,
            child: Image.asset("Image/try2.jpg", fit: BoxFit.fill),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.004),
            ),
            //TODO: USER IMAGE
          ),
          SizedBox(height: screenHeight * 0.0234),
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
                  'Email',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //Email field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _emailEditProfileTextField,
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
                      hintText: "user@user.user",
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
          SizedBox(height: screenHeight * 0.0234),
          //Current password Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Text(
                  'Current Password',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //Current password field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _currentPasswordEditProfileTextfield,
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
          SizedBox(height: screenHeight * 0.0234),
          //New password Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Text(
                  'New Password',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //New Password Field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _newPasswordEditProfileTextfield,
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
          SizedBox(height: screenHeight * 0.0234),
          //Name Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _nameEditProfileTextfield,
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
          SizedBox(height: screenHeight * 0.0234),
          //Address Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Text(
                  'Address',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //Address Field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _addressEditProfileTextfield,
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
          SizedBox(height: screenHeight * 0.0234),
          //Age Text
          Container(
            height: screenHeight * 0.0295,
            width: screenWidth,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.067,
                ),
                Text(
                  'Age',
                  style: TextStyle(
                    //Deafult font
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: screenHeight * 0.022,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //Age field
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: Form(
              key: _ageEditProfileTextfield,
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
          SizedBox(height: screenHeight * 0.0234),
          // Edit Raised button
          RaisedButton(
            color: Colors.black,
            child: Text(
              "Edit",
              style: TextStyle(
                fontSize: screenHeight * 0.0197,
                color: Colors.white,
              ),
            ),
            onPressed: _submit,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenHeight * 0.0369),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.2, vertical: screenHeight * 0.022),
          ),
          SizedBox(height: screenHeight * 0.0234),
        ],
      ),
    );
  }

  void _submit() {
    if (!_emailEditProfileTextField.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_currentPasswordEditProfileTextfield.currentState.validate()) {
      return;
    }
    ;
    if (!_newPasswordEditProfileTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_nameEditProfileTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_addressEditProfileTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    if (!_ageEditProfileTextfield.currentState.validate()) {
      return; //invalid
    }
    ;
    _emailEditProfileTextField.currentState.save();
    _currentPasswordEditProfileTextfield.currentState.save();
    _newPasswordEditProfileTextfield.currentState.save();
    _nameEditProfileTextfield.currentState.save();
    _addressEditProfileTextfield.currentState.save();
    _ageEditProfileTextfield.currentState.save();
  }
}
