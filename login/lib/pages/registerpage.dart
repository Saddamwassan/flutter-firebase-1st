import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showloginpage;
  const RegisterPage({Key? key, required this.showloginpage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    confirmpasscontroller.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    agecontroller.dispose();
    super.dispose();
  }

  //Add a user
  Future signUp() async {
    if (confirmedpassword()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passcontroller.text.trim());

      //Add user info
      AddUserInfo(
          firstnamecontroller.text.trim(),
          lastnamecontroller.text.trim(),
          emailcontroller.text.trim(),
          int.parse(agecontroller.text.trim()));
    }
  }

  Future AddUserInfo(
      String firstname, String lastname, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'age': age,
    });
  }

  bool confirmedpassword() {
    if (passcontroller.text.trim() == confirmpasscontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                "Congratulations!",
                style: GoogleFonts.bebasNeue(fontSize: 54),
              ),

              SizedBox(
                height: 7,
              ),
              Text(
                "NOw you are part of this plateform .",
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(
                height: 33,
              ),

              //firstName

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
                        controller: firstnamecontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "FirstName"),
                      ),
                    )),
              ),
              SizedBox(
                height: 11,
              ),

              //lastname

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
                        controller: lastnamecontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "LastName"),
                      ),
                    )),
              ),
              SizedBox(
                height: 11,
              ),

              //age field

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
                        controller: agecontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Age"),
                      ),
                    )),
              ),

              SizedBox(
                height: 11,
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

              // confirmed password

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
                      controller: confirmpasscontroller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " Confirm Password"),
                      obscureText: true,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 11,
              ),

              // sign up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Sign up",
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
                    " I am a Member",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showloginpage,
                    child: Text("Login here",
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
