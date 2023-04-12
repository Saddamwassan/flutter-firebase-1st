import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  final text1 = TextStyle(fontSize: 27, fontWeight: FontWeight.bold);
  final text2 = TextStyle(fontSize: 21, fontWeight: FontWeight.bold);
  final text3 = TextStyle(
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
    
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/newdash.png'), fit: BoxFit.cover),
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Ali!',
              style: GoogleFonts.anekLatin(textStyle: text1),
            ),
            Text('How Can we help You?',
                style: GoogleFonts.comfortaa(textStyle: text2)),
            Text('Services on your doorstep',
                style: GoogleFonts.ubuntuMono(textStyle: text3)),
          ],
        ),
      ),
    );
  }
}
