import 'package:flutter/material.dart';
import 'package:gpst_app/Login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor:Colors.yellow[400],
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
enum AuthMode {SignUp}
class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState>_EmailSignupTextField =GlobalKey();
  final GlobalKey<FormState>_PasswordSignupTextfield =GlobalKey();
  final GlobalKey<FormState>_ConfirmPasswordSignupTextfield =GlobalKey();
  final GlobalKey<FormState>_NameSignupTextfield =GlobalKey();
  final GlobalKey<FormState>_AddressSignupTextfield =GlobalKey();
  final GlobalKey<FormState>_AgeSignupTextfield =GlobalKey();
  Map<String, String>_authData ={
    'email':'',
    'password':'',
    'Confirm password':'',
    'Name':'',
    'Address':'',
    'Age':'',
  };
  final _passwordController =TextEditingController();
  bool passwordVisiable=true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Row(
            children: <Widget>[
              Text(
                "  Sign Up",
                style: TextStyle(
                  fontFamily:'Langar',
                  color: Colors.yellow[900],
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(height:10 ),

          Row(
            children: <Widget>[
              Text(
                "     Email",
                style: TextStyle(
                  fontFamily:'Langar',
                  color: Colors.yellow[900],
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _EmailSignupTextField,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  // labelText:"Email",
                  hintText: "    Your Email",
                  contentPadding: const EdgeInsets.all(20),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val){
                  if(val.isEmpty || !val.contains("@"))
                  {
                    return "please enter a valid email address";
                  }return null;
                },
                onSaved:(val){
                  _authData ['email'] =val;
                  print(_authData ['email']);
                } ,
              ),
            ),
          ),
          SizedBox(height:20 ),
          Row(
            children: <Widget>[
              Text(
                "     Password",
                style: TextStyle(
                  fontFamily:'Langar',
                  color: Colors.yellow[900],
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _PasswordSignupTextfield,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  // labelText:"Password",
                  hintText: "    Your password",
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon:IconButton(icon: Icon(passwordVisiable?Icons.visibility:Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          passwordVisiable =!passwordVisiable;
                        });
                      }
                  ),
                ),
                controller: _passwordController,
                obscureText: !passwordVisiable,
                validator: (val){
                  if(val.isEmpty || val.length<7)
                  {
                    return " Password must be at least 7 characters ";
                  }return null;
                },
                onSaved:(val){
                  _authData ['password'] =val;
                  print(_authData ['password']);
                } ,
              ),
            ),
          ),
          SizedBox(height:20 ),

          Row(
            children: <Widget>[
              Text(
                "     Confirm Password",
                style: TextStyle(
                  fontFamily:'Langar',
                  color: Colors.yellow[900],
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _ConfirmPasswordSignupTextfield,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  // labelText:"Password",
                  hintText: "    Your password",
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon:IconButton(icon: Icon(passwordVisiable?Icons.visibility:Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          passwordVisiable =!passwordVisiable;
                        });
                      }
                  ),
                ),
                controller: _passwordController,
                obscureText: !passwordVisiable,
                validator: (val){
                  if(val.isEmpty || val.length<7)
                  {
                    return " Password must be at least 7 characters ";
                  }return null;
                },
                onSaved:(val){
                  _authData ['Confirm password'] =val;
                  print(_authData ['Confirm password']);
                } ,
              ),
            ),
          ),
          SizedBox(height:20 ),
          Row(
            children: <Widget>[
              Text(
                "     Name",
                style: TextStyle(
                  fontFamily:'Langar',
                  color: Colors.yellow[900],
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _NameSignupTextfield,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  // labelText:"Email",
                  hintText: "    Your Name",
                    contentPadding: const EdgeInsets.all(20),
                ),
                keyboardType: TextInputType.name,
                validator: (val){
                  if(val.isEmpty )
                  {
                    return "please enter your Name";
                  }return null;
                },
                onSaved:(val){
                  _authData ['Name'] =val;
                  print(_authData ['Name']);
                } ,
              ),
            ),
          ),
          SizedBox(height:20 ),
          Row(
            children: <Widget>[
              Text(
                "     Address",
                style: TextStyle(
                  fontFamily:'Langar',
                  color: Colors.yellow[900],
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _AddressSignupTextfield,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  // labelText:"Email",
                  hintText: "    Your Address",
                    contentPadding: const EdgeInsets.all(20),
                ),
                keyboardType: TextInputType.text,
                validator: (val){
                  if(val.isEmpty )
                  {
                    return "please enter a valid  address";
                  }return null;
                },
                onSaved:(val){
                  _authData ['Address'] =val;
                  print(_authData ['Address']);
                } ,
              ),
            ),
          ),
          SizedBox(height:20 ),
          Row(
            children: <Widget>[
              Text(
                "     Age",
                style: TextStyle(
                  fontFamily:'Langar',
                  color: Colors.yellow[900],
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _AgeSignupTextfield,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "    Your Age",
                    contentPadding: const EdgeInsets.all(20),
                ),
                keyboardType: TextInputType.number,
                validator: (val){
                  if(val.isEmpty )
                  {
                    return "please enter your Age";
                  }return null;
                },
                onSaved:(val){
                  _authData ['Age'] =val;
                  print(_authData ['Age']);
                } ,
              ),
            ),
          ),
          SizedBox(height:20 ),
          RaisedButton(
            color: Colors.yellow[900],
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontFamily:'Langar',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: _submit,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal:90 ,vertical:18 ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed:() =>_jump(context),
                child: Text(
                  "I already have an account",
                  style: TextStyle(
                    fontFamily:'Langar',
                    color: Colors.yellow[900],
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  //TODO:TRY TO MINIMIZE
  void _submit(){
    if(!_EmailSignupTextField.currentState.validate()) {
      return; //invalid
    };
    if(!_PasswordSignupTextfield.currentState.validate()){
      return;
    };
    if(!_ConfirmPasswordSignupTextfield.currentState.validate()) {
      return; //invalid
    };
    if(!_NameSignupTextfield.currentState.validate()) {
      return; //invalid
    };
    if(!_AddressSignupTextfield.currentState.validate()) {
      return; //invalid
    };
    if(!_AgeSignupTextfield.currentState.validate()) {
      return; //invalid
    };
    _EmailSignupTextField.currentState.save();
    _PasswordSignupTextfield.currentState.save();
    _ConfirmPasswordSignupTextfield.currentState.save();
    _NameSignupTextfield.currentState.save();
    _AddressSignupTextfield.currentState.save();
    _AgeSignupTextfield.currentState.save();
  }
  void _jump(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(
          builder: (_){
            return MyLogin();
          }
      ),
    );
  }
}