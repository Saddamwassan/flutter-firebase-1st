import 'package:finalproj/more/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Seller extends StatefulWidget {
  const Seller({Key? key}) : super(key: key);

  @override
  State<Seller> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
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
                        // controller:
                        //  firstnamecontroller
                        // ,
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
                        // controller: lastnamecontroller,
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
                        // controller: agecontroller,
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
                        // controller: emailcontroller,
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
                      // controller: passcontroller,
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
                      // controller: confirmpasscontroller,
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
                  // onTap: signUp,
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
                            MaterialPageRoute(builder: (context) => Auth()));
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
