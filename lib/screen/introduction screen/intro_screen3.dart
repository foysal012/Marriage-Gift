import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen3 extends StatefulWidget {
  const IntroScreen3({Key? key}) : super(key: key);

  @override
  State<IntroScreen3> createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/intro3.jpg"))
          ),
        ),

        Positioned(
            top: 200,
            left: 20,
            child: Text("SPOUSES ARE LIKE GARMENTS TO ONE ANOTHER",
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
