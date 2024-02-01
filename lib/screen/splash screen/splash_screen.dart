import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marriage_gift/screen/introduction%20screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState

    Timer(
        Duration(seconds: 2),
            () {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => IntroScreen()), (route) => false);
            }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
         color: Colors.white,
        ),
        child: Column(
          children: [

            SizedBox(
              height: height * 0.3,
            ),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/w1.gif"))
              ),
            ),

            SizedBox(
              height: height * 0.01,
            ),

            Text("Marriage Gieft",
            style: GoogleFonts.happyMonkey(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),

            SizedBox(
              height: height * 0.22,
            ),

            SpinKitThreeInOut(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Color(0xff888887): Color(0xff74D5FD),
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),

            SizedBox(
              height: height * 0.02,
            ),

            Text("Design & Developed By",
              style: GoogleFonts.oswald(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text("Foysal Joarder",
              style: GoogleFonts.oswald(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
