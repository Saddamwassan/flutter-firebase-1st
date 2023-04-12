import 'package:finalproj/screens/chooseReg.dart';
import 'package:finalproj/screens/login.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showloginpage = true;

  void toggleScreen() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return Login(showChooseReg: toggleScreen);
    } else {
      return ChooseReg(showloginpage: toggleScreen);
    }
  }
}
