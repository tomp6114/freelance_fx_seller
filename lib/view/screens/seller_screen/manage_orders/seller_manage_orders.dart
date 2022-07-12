import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';


class SellerManageOrders extends StatelessWidget {
  const SellerManageOrders({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: kwhite,
          centerTitle: true,
          title: Text(
            "Manage Orders",
            style: GoogleFonts.montserrat(
              fontSize: 26,
              color: titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: titleColor,
            tabs: [
              Tab(
                child: Text(
                  "Pending",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Completed",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PendingOrdersBuyer(),
            CompletedOrdersBuyer(),
          ],
        ),
      ),
    );
  }
}

class CompletedOrdersBuyer extends StatelessWidget {
  const CompletedOrdersBuyer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight20,
        ListTile(
          leading: SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(""),
              //clipBehavior: Clip.antiAlias,
            ),
          ),
          title: Text(
            "Tom P Varghese",
            style: GoogleFonts.montserrat(),
          ),
        )
      ],
    );
  }
}

class PendingOrdersBuyer extends StatelessWidget {
  const PendingOrdersBuyer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight20,
        ListTile(
          leading: SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(""),
              //clipBehavior: Clip.antiAlias,
            ),
          ),
          title: Text(
            "Tom P Varghese",
            style: GoogleFonts.montserrat(),
          ),
        )
      ],
    );
  }
}
