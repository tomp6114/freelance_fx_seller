import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_fx_seller/view/screens/seller_screen/service_creation/service_creation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/size.dart';
import '../seller_screen/auth_screen/login_screen.dart';
import '../seller_screen/auth_screen/signup_screen.dart';
import '../seller_screen/bottom_navigation_seller/bottom_navigation_seller.dart';


class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavigationSeller();
          } else {
            return OnBoardWidget(size: size);
          }
        });
  }
}

class OnBoardWidget extends StatelessWidget {
  const OnBoardWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: onBoardBackground,
        elevation: 0,
        title: Text(
          "Freelance FX",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold, fontSize: 30, color: titleColor),
        ),
      ),
      body: Container(
        color: onBoardBackground,
        child: PageView(
          children: [
            Pages(
              image: "assets/images/Screenshot from 2022-05-18 20-33-17.png",
              text1: "Never miss an opportunity\n",
              text2: "    Easily find work, chat,\nand collaborate on the go ",
            ),
            Pages(
              image: "assets/images/Screenshot from 2022-05-18 21-06-18.png",
              text1: "Find interesting projects\n  and submit proposals",
              text2: "    Easily find work, chat,\nand collaborate on the go ",
            ),
            Pages(
              image: "assets/images/Screenshot from 2022-05-18 21-17-05.png",
              text1: "Collaborate on  the  go",
              text2:
                  "Chat , share files and complete \n               projects",
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: onBoardBackground,
        height: size.height * 0.15,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.off(LoginScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 120.0, right: 120.0, top: 15.0, bottom: 15.0),
                  child: Text(
                    "Log In",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(titleColor)),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                  //   return BottomNavigationBuyer();
                  // }));
                  Get.off(SignupScreen());
                },
                child: Text(
                  "New to Freelance Fx  Sign Up?",
                  style:
                      GoogleFonts.montserrat(color: titleColor, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  Pages({
    Key? key,
    required this.image,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  String image;
  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Stack(
              //alignment: Alignment.center,
              children: [
                Container(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.color,
                    filterQuality: FilterQuality.high,
                  ),
                  height: 300,
                  width: 400,
                ),
                Container(
                  color: Color.fromARGB(29, 34, 33, 33),
                  height: 300,
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                text1,
                style: GoogleFonts.montserratAlternates(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              kheight20,
              Text(
                text2,
                style: GoogleFonts.montserrat(fontSize: 18, wordSpacing: 2),
              ),
            ],
          ),
          kheight80,
        ],
      ),
    );
  }
}
