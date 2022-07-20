import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/size.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    toOnBoardScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/images/62934186287cb810b443786f.png",
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              kheight20,
              Text(
                "Freelance FX",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: titleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> toOnBoardScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) {
              return OnBoardScreen();
            },
          ),
        );
      },
    );
  }
}
