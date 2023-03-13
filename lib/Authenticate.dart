import 'package:flutter/material.dart';
import 'package:flutterfrst/Register.dart';
import 'package:flutterfrst/Sign_In.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn= true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return Sign_In(toogleView: toggleView,);
    }
    else{
      return Register(toogleView: toggleView,);
    }
  }
}
