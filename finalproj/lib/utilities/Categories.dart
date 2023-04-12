import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorie extends StatelessWidget {
  // final String Category;
  final String Cateimagepath;
  final String Categname;
  final style = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  Categorie({
    required this.Cateimagepath,
    required this.Categname,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 7),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: Colors.white),
          width: 77,
          child: Column(
            children: [
              // category images
              Padding(
                padding: const EdgeInsets.all(11),
                child: ClipRRect(
                  child: Image(image: AssetImage(Cateimagepath)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              //category name
              Text(Categname, style: GoogleFonts.ubuntu(textStyle: style)),
            ],
          ),
        ));
  }
}
