import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({Key? key}) : super(key: key);

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/intro2.png"))
          ),
        ),

        Positioned(
            top: 200,
            left: 20,
            child: Text("MARRIAGE BRINGS TRANQULITY AND MERCY",
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
