import 'package:flutter/material.dart';
import 'package:gpst_app/Login.dart';
//import 'main.dart';
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
  final GlobalKey<FormState>_formkey =GlobalKey();
  final GlobalKey<FormState>_Formkey =GlobalKey();
  final GlobalKey<FormState>_fOrmkey =GlobalKey();
  final GlobalKey<FormState>_foRmkey =GlobalKey();
  final GlobalKey<FormState>_forMkey =GlobalKey();
  final GlobalKey<FormState>_formkEy =GlobalKey();
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
                  color: Colors.black,
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
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _formkey,
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
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _Formkey,
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
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _fOrmkey,
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
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _foRmkey,
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
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _forMkey,
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
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Form(
            key: _formkEy,
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
            color: Colors.black,
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
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
                    color: Colors.black,
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
    if(!_formkey.currentState.validate()) {
      return; //invalid
    };
    if(!_Formkey.currentState.validate()){
      return;
    };
    if(!_fOrmkey.currentState.validate()) {
      return; //invalid
    };
    if(!_foRmkey.currentState.validate()) {
      return; //invalid
    };
    if(!_forMkey.currentState.validate()) {
      return; //invalid
    };
    if(!_formkEy.currentState.validate()) {
      return; //invalid
    };
    _formkey.currentState.save();
    _Formkey.currentState.save();
    _fOrmkey.currentState.save();
    _foRmkey.currentState.save();
    _forMkey.currentState.save();
    _formkEy.currentState.save();
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