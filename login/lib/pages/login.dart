import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgotpasspage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
// import 'firebase_options.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
// import 'global_variables.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Login({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text controllers
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  //signed in method
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
    }
  }

  // signin with google method
  Future<void> googleAuth() async {
    try {
      //To check internet connectivity
      await InternetAddress.lookup('firebase.google.com');

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth == null) {
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) => Navigator.pushNamed(context, "/home", arguments: value));
    } catch (e) {
      print("Error: $e");
      return;
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              SizedBox(
                height: 75,
              ),

              Icon(
                Icons.supervised_user_circle_rounded,
                size: 112,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "welcome",
                style: GoogleFonts.bebasNeue(fontSize: 54),
              ),

              SizedBox(
                height: 7,
              ),
              Text(
                "hi its my new android app .",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 33,
              ),

              //email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      ),
                    )),
              ),
              SizedBox(
                height: 11,
              ),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: TextFormField(
                      controller: passcontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                      obscureText: true,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              // signin with google
              ElevatedButton(
                onPressed: googleAuth,
                child: Text("Login With Google"),
              ),
              // forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPassPage();
                            },
                          ),
                        );
                      },
                      child: Text("Forgot Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              // sign in button container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 11,
              ),

              //not a member? Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member ?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text("Register Yourself",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
