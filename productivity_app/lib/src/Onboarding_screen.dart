import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:productivity_app/src/signin_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final LiquidController _liquidController = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages(context),
            enableLoop: false,
            fullTransitionValue: 300,
            enableSideReveal: true,
            slideIconWidget: Icon(
              Icons.arrow_back_ios,
              size: 40,
            ),
            waveType: WaveType.liquidReveal,
            positionSlideIcon: 0.5,
            liquidController: _liquidController,
            onPageChangeCallback: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          Positioned(
            top: 30,
            right: 20,
            child: TextButton(
              onPressed: () {
                _liquidController.animateToPage(
                  page: pages(context).length - 1,
                  duration: 700,
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: AnimatedSmoothIndicator(
                activeIndex: currentPage,
                count: pages(context).length,
                effect: ExpandingDotsEffect(
                  dotHeight: 6,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: currentPage == pages(context).length - 1
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.05,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  List<Widget> pages(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return [
      Container(
        width: screenWidth,
        height: screenHeight,
        color: Color(0xFFE2E2E5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.1),
              child: Image.asset(
                "assets/images/ob1.png",
                height: screenHeight * 0.5,
                width: screenWidth * 0.9,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text.rich(
                  TextSpan(
                    text: "Transform Your Day  \n with ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nAI-Powered ',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(-1.8, -1.8),
                              color: Colors.white,
                              blurRadius: 5.0,
                            ),
                            Shadow(
                              offset: Offset(1.8, 1.8),
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                      TextSpan(
                        text: 'Productivity!',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.1),
              child: Image.asset(
                "assets/images/ob2.png",
                height: screenHeight * 0.4,
                width: screenWidth * 0.9,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text.rich(
                  TextSpan(
                    text: "Achieve Your Goals \n with ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n Personalized AI Assistance',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(-1.8, -1.8),
                              color: Colors.white,
                              blurRadius: 5.0,
                            ),
                            Shadow(
                              offset: Offset(1.8, 1.8),
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color(0xFFE2E2E2E5),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.1),
              child: Image.asset(
                "assets/images/ob3.png",
                height: screenHeight * 0.4,
                width: screenWidth * 0.8,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text.rich(
                  TextSpan(
                    text: "Simplify Your ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Life',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(-1.8, -1.8),
                              color: Colors.white,
                              blurRadius: 5.0,
                            ),
                            Shadow(
                              offset: Offset(1.8, 1.8),
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                      TextSpan(
                        text: "\nwith",
                      ),
                      TextSpan(
                        text: '\nIntelligent',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(-1.8, -1.8),
                              color: Colors.white,
                              blurRadius: 5.0,
                            ),
                            Shadow(
                              offset: Offset(1.8, 1.8),
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      ),
                      TextSpan(text: ' Routine Automation!'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
