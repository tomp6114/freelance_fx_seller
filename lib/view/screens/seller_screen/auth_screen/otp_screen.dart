import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../constants/colors.dart';
import '../../../constants/size.dart';

import '../bottom_navigation_seller/bottom_navigation_seller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 4,
        centerTitle: true,
        title: Text("Freelance Fx",
            style: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 121, 25, 180),
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: const Color.fromARGB(205, 246, 243, 243),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).size.height / 4,
          color: const Color.fromARGB(205, 246, 243, 243),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.epilogue(
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: kblack,
                    ),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Verification code is send to\n\n ",
                      style: TextStyle(color: Color.fromARGB(255, 14, 13, 13)),
                    ),
                    TextSpan(
                        // text: phone,
                        )
                  ],
                ),
              ),
              kheight20,
              // Center(
              //   child: Pinput(
              //     onCompleted: (pin) {
              //       // validateOtpApi(context, name ?? '', password ?? '',
              //       //     email ?? "", phone ?? '', pin);
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kgreenlight),
                ),
                onPressed: ()  {
                  Get.off(BottomNavigationSeller());
                  // print(otp);
                  // validateOtpApi(context, name ?? '', password ?? '',
                  //     email ?? "", phone ?? '', otp);
                },
                child: Text(
                  "Ok",
                  style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 244, 243, 245),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              kheight80,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 15,
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      "Didn't recieve code? Request again",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 76, 63, 83),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
