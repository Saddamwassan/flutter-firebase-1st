import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproj/more/auth.dart';
import 'package:finalproj/more/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Buyer extends StatefulWidget {
 

  @override
  State<Buyer> createState() => _BuyerState();
}

class _BuyerState extends State<Buyer> {
  //controllers 
  final emailcontroller = TextEditingController();
 final passwordcontroller = TextEditingController();
 final confirmedpasscontroller = TextEditingController();
 final firstnamecontroller = TextEditingController();
 final lastnamecontroller  = TextEditingController();
 

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmedpasscontroller.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    super.dispose();
  }
 
 Future signup() async{
  // Create User
 if(passwordconfirmed()==true){
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:emailcontroller.text.trim(),
    password: passwordcontroller.text.trim()
  );
  // Add User Details
  addUserDetails(firstnamecontroller.text.trim(),lastnamecontroller.text.trim());
 }
 else{
  showDialog(context: context, builder: (context){
    return AlertDialog(
      content: Text('password does not match'),
    );
  });
 }
 }
 //addUserdetails
 Future addUserDetails( String firstname,String lastname) async{
  await FirebaseFirestore.instance.collection('user').add({
    'firstname' : firstname,
    'lastname': lastname,
  });
 }
 //passwordconfirmed
 bool passwordconfirmed(){
  if(passwordcontroller.text.trim()==confirmedpasscontroller.text.trim()){
    return true;
  }
  else{
    return false;
  }
 }
 

 //textStyle 
  final text = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
  final text1 =
      TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Container(
                  height: 222,
                  decoration: BoxDecoration(color: Colors.white),
                  child: SvgPicture.asset('assets/signup.svg')),
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
                        controller:
                         firstnamecontroller
                        ,
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
                      controller: passwordcontroller,
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
                      controller: confirmedpasscontroller,
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
                  onTap: signup,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " I am a Member",
                      style: text,
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MainPage()));
                      },
                      child: Text("Login here", style: text1),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.grey[400]),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
