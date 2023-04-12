// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import 'Homepage.dart';

// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(
//         Duration(seconds: 4),
//         () => Navigator.push(
//             context, MaterialPageRoute(builder: (context) => )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//             child: Column(
//           children: [
//             Lottie.asset(
//               'assets/repair.json',
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.black),
//               ),
//               child: Text(
//                 "Call A Professional...",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(height: 12),
//             Container(
//               child: Text(" & Fix your Problems! ",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(14),
//                   color: Colors.orange),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
