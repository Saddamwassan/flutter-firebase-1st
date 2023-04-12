import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recommend extends StatelessWidget {
  final text1 = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  final text2 = TextStyle(
      fontSize: 25,
      color: Color.fromARGB(255, 61, 86, 247),
      fontWeight: FontWeight.bold);
  final text3 = TextStyle(fontSize: 17);
  final text4 = TextStyle(
      fontSize: 22,
      color: Color.fromARGB(255, 61, 86, 247),
      fontWeight: FontWeight.bold);
  final text5 = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  final String Ratting;
  final String Recimgpath;
  final String Field;
  final String Recname;
  final String Price;
  final String discount;

  Recommend(
      {required this.Recimgpath,
      required this.Ratting,
      required this.Field,
      required this.Recname,
      required this.Price,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 166,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 133,
                width: 144,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Recimgpath), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)),
                // child:
                //  Image.asset('assets/plumber1.jpg')
              ),
            ),
            SizedBox(
              width: 22,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(Ratting,
                        style: GoogleFonts.anekLatin(textStyle: text1)),
                    SizedBox(
                      width: 122,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Off $discount%',
                        style: GoogleFonts.dosis(textStyle: text5),
                      ),
                    )
                  ],
                ),
                //service
                Text(Field, style: GoogleFonts.anekLatin(textStyle: text2)),
                //seller Name
                Text("By $Recname",
                    style: GoogleFonts.anekLatin(textStyle: text3)),
                //price
                Text("\$$Price/h",
                    style: GoogleFonts.anekLatin(textStyle: text4)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
