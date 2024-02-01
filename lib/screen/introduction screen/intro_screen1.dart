import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/intro1.png"))
          ),
        ),

        Positioned(
            top: 200,
            left: 20,
            child: Text("SUPPLICATION TO RECITE FOR THE NEWLYWEDS",
            style: GoogleFonts.lobster(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
            ))
      ],
    );
  }
}
