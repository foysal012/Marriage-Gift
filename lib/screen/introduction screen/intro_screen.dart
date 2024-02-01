import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marriage_gift/screen/homepage_screen.dart';
import 'package:marriage_gift/screen/introduction%20screen/intro_screen1.dart';
import 'package:marriage_gift/screen/introduction%20screen/intro_screen2.dart';
import 'package:marriage_gift/screen/introduction%20screen/intro_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  bool onLastPage = false;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index){
              //state management korte hobe
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                InkWell(
                  onTap: (){
                    pageController.jumpToPage(2);
                  },
                  child: Text("Skip",
                    style: GoogleFonts.inter(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                ),

                onLastPage == true ?
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePageScreen()), (route) => false);
                  },
                  child: Text("Done",
                    style: GoogleFonts.inter(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ) :
                InkWell(
                  onTap: (){
                    pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceInOut
                    );
                  },
                  child: Text("Next",
                    style: GoogleFonts.inter(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
