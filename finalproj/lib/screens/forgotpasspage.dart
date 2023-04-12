import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Forgotpasspage extends StatefulWidget {
  const Forgotpasspage({Key? key}) : super(key: key);

  @override
  State<Forgotpasspage> createState() => _ForgotpasspageState();
}

class _ForgotpasspageState extends State<Forgotpasspage> {
  final resetpasscontroller = TextEditingController();

  @override
  void dispose(){
    resetpasscontroller.dispose();
    super.dispose();
  }
  
  Future forgotpassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: resetpasscontroller.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Check your Email'),
        );
      });

    } on FirebaseAuthException catch (e) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your email '),
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
                        controller: resetpasscontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      ),
                    )),
              ),
              ElevatedButton(onPressed: forgotpassword, child: Text('send'))
        ],
      ),
    );
  }
}