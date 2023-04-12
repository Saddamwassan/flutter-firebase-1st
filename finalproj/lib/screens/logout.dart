import 'package:flutter/material.dart';

import '../more/drawermenuwidget.dart';

class Logout extends StatelessWidget {
  final VoidCallback openDrawer;
  Logout({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: DrawerMenuWidget(onClicked: openDrawer),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("logout here!"),
      ]),
    );
  }
}
