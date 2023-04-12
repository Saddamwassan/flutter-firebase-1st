import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'forgotpasspage.dart';

class Login extends StatefulWidget {
  final VoidCallback showChooseReg;
  const Login({Key? key, required this.showChooseReg}) : super(key: key);

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
 


  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // svg image
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                      height: 222,
                      decoration: BoxDecoration(color: Colors.white),
                      child: SvgPicture.asset("assets/login.svg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text("Welcome back",
                      style: TextStyle(
                        fontSize: 17,
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 21, top: 2),
                  child: Text("Login With ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                ),

                Padding(
                    padding:
                        const EdgeInsets.only(left: 19, top: 26, bottom: 13),
                    // Email
                    child: Text("Email", style: TextStyle(fontSize: 19))),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                          ),
                        ),
                      )),
                ),
                // password
                Padding(
                    padding:
                        const EdgeInsets.only(left: 19, top: 23, bottom: 13),
                    // Email
                    child: Text("Password", style: TextStyle(fontSize: 19))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: TextFormField(
                         
                          controller: passcontroller,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                          ),
                        ),
                      )),
                ),
                // forgot password
                Padding(
                  padding: const EdgeInsets.only(top: 12, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpasspage()));
                        },
                        child: 
                        Text("forgot password ?", style: TextStyle(fontSize: 15)
                        )
                        ),
                    ],
                  ),
                ),
                // sign in button
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: signIn,
                        child: Container(
                            height: 55,
                            width: 380,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(33)),
                            child: Center(child: Text("Sign in"))),
                      ),
                    ],
                  ),
                ),
                // or sign up with
                Container(
                  width: 444,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(19),
                        child: Text("Or Sign up with",
                            style: TextStyle(fontSize: 19)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home),
                          Icon(Icons.home),
                          Icon(Icons.home),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have account?",
                                style: TextStyle(fontSize: 17)),
                            GestureDetector(
                              onTap: widget.showChooseReg,
                              child: Text("Register Now",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.blue[600])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
