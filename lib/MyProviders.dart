import 'package:flutter/material.dart';
import 'Screen2.dart';

//......................................................................................................
//here..>step1:put the function that happens every change in state.
//step2:in the screen page :make provider as a parent of the root "to be child"
//....................via wrap with widget'home:ChangeNotifierProvider<MyProvider>{step3}'.
//step3:To define MyProvider Seperated class as a real provider "1" use create:(_)=>MyProvider()
//step4:Delete 'state' and convert stf..>stl.
//inside on pressed ...>Provider.of<MyProvider>(context).FunctionName();
//Note:super represent parent
//......................................................................................................
//To Store state inside
class MyProviders with ChangeNotifier {
  //put here the function that will called when press the button.
  //JUMP TO  St-SCREEN 2

  void jump(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return Screen2();
      }),
    );
  }
  //if any change happens in state..>this will notify all the listeners of this State.
}
