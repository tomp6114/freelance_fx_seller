import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_fx_seller/authentication/auth_helper.dart';
import 'package:freelance_fx_seller/view/screens/onboard_screen/onboard_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import '../bottom_navigation_seller/bottom_navigation_seller.dart';

class SellerAccountScreen extends StatelessWidget {
  const SellerAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        toolbarHeight: 200,
        leading: SizedBox(),
        title: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(190, 46, 44, 44),
                  borderRadius: BorderRadius.circular(10)),
            ),
            kheight20,
            Text(
              "Tom P Varghese",
              style: GoogleFonts.montserrat(color: kblack),
            )
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Freelance Fx",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.favorite_border),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Saved Services", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.account_circle_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Profile", style: TextStyle(fontSize: 20))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "General",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.ios_share),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Invite a friend", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.support_agent),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Support", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Settings", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //  Row(
                  //    children: const[
                  //      Icon(Icons.logout),
                  //      SizedBox(
                  //        width: 10,
                  //      ),
                  //      Text("Sign-out",style: TextStyle(fontSize: 20))
                  //    ],
                  //  )
                  TextButton.icon(
                      onPressed: () async {
                        await AuthMethods().logoutUser();
                      },
                      icon: Icon(Icons.logout),
                      label: Text(
                        "Logout",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  
}
