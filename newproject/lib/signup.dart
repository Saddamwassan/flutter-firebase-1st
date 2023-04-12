import 'package:flutter/material.dart';

class SignUpp extends StatefulWidget {
  const SignUpp({Key? key}) : super(key: key);

  @override
  State<SignUpp> createState() => _SignUppState();
}

class _SignUppState extends State<SignUpp> {
  @override
  late TextEditingController email;
  late TextEditingController password;

  bool isShowButton = false;
  var data = 0;

  
 void initState(){
   super.initState();

   email = TextEditingController();
   password=TextEditingController();

    email.addListener(() {
      final isShowButton = email.text.isNotEmpty;

      if (email.text.length !=0) {
        setState(() => this.isShowButton = true);
       
      } 

    });

 
 }
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://unsplash.com/photos/5J1bHRX1fNw")))),
        Text("User data"),
        TextFormField()
      ],
    );
  }
}
