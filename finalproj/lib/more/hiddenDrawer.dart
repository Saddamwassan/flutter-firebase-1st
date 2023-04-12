// import 'package:finalproj/screens/Homepage.dart';
// import 'package:finalproj/screens/logout.dart';
// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

// class HiddenDrawer extends StatefulWidget {
//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }

// class _HiddenDrawerState extends State<HiddenDrawer> {
//   List<ScreenHiddenDrawer> pages = [];

//   @override
//   void initState() {
//     super.initState();

//     pages = [
//       // HomePage
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//             name: 'HomePage',
//             baseStyle: TextStyle(),
//             selectedStyle: TextStyle(),
            
//           ),
//           HomePage()),
//       // Logoutpage
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               name: 'Logout',
//               baseStyle: TextStyle(),
//               selectedStyle: TextStyle()),
//           Logout())
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HiddenDrawerMenu(
//         backgroundColorMenu: Colors.deepOrangeAccent,
//         screens: pages,
//         initPositionSelected: 0,
//         slidePercent: 60,
//       ),
//     );
//   }
// }
