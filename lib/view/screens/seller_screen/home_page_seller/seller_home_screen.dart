import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height - 70,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 5,
                      ),
                      child: Container(
                        width: size.width * 0.09,
                        height: size.height * 0.04,
                        child: Image.asset(
                          "assets/images/62934186287cb810b443786f.png",
                        ),
                      ),
                    ),
                    Text(
                      "Freelance FX",
                      style: GoogleFonts.montserrat(
                        color: titleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(192, 199, 199, 199),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  height: size.height * 0.33,
                  width: size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 10.0),
                        child: ListTile(
                          leading: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(167, 165, 240, 204),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            height: size.height * 0.07,
                            width: size.width * 0.2,
                          ),
                          title: Text(
                            "Tom P Varghese",
                            style: GoogleFonts.montserrat(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Logo Design",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, right: 30, top: 10),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: Colors.blue[200],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0, top: 0),
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: size.width - 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border:
                          Border.all(color: Color.fromARGB(255, 180, 177, 177))),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.wallet_travel,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    label: Text(
                      "My Wallet",
                      style: GoogleFonts.montserrat(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: Text(
                      "My Earnings",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, top: 10),
                    child: Text(
                      "Details",
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(197, 253, 252, 252),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Color.fromARGB(137, 139, 139, 139),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Personal Balance"),
                            Text("Completed Orders")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Earnings in march"),
                            Text("Avg Earnings in 2022")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Active Orders"),
                            Text("Cancelled Orders")
                          ],
                        )
                      ],
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
