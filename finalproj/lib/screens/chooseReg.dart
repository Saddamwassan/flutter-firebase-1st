import 'package:finalproj/more/auth.dart';
import 'package:finalproj/screens/buyer.dart';
import 'package:finalproj/screens/seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseReg extends StatefulWidget {
  final VoidCallback showloginpage;
  const ChooseReg({Key? key, required this.showloginpage}) : super(key: key);

  @override
  State<ChooseReg> createState() => _ChooseRegState();
}

class _ChooseRegState extends State<ChooseReg> {
  final text = TextStyle(fontSize: 33, fontWeight: FontWeight.bold);
  final text1 = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
  final text2 =
      TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SvgPicture.asset("assets/decide.svg")),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Text(
                          'Sign up as:',
                          style: text,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 22),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Seller
                      Container(
                        height: 66,
                        width: 366,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Seller()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 54, 70, 244),
                                  textStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              child: Text("Seller")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                  //Buyer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 66,
                        width: 366,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Buyer()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 54, 70, 244),
                                  textStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              child: Text("Buyer")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " I am a Member",
                          style: text1,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Auth()));
                          },
                          child: Text("Login here", style: text2),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey[300]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
