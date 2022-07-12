import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class SellerChatScreen extends StatelessWidget {
  const SellerChatScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(205, 246, 243, 243)),
          child: Column(
            children: [
              AppBar(
                elevation: 0.2,
                backgroundColor: const Color.fromARGB(255, 250, 248, 248),
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    'Message',
                    style: GoogleFonts.montserrat(
                      color: kSellerColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MessageTile(
                  image: "",
                  lastMessage: "hello",
                  name: "Tom P Varghese",
                  time: "11:00 am"),
              MessageTile(
                  image: "",
                  lastMessage: "hello",
                  name: "Tom P Varghese",
                  time: "11:00 am"),
              MessageTile(
                  image: "",
                  lastMessage: "hello",
                  name: "Tom P Varghese",
                  time: "11:00 am"),
              MessageTile(
                  image: "",
                  lastMessage: "hello",
                  name: "Tom P Varghese",
                  time: "11:00 am"),
            ],
          ),
        ),
      ),
    );
  }
}



class MessageTile extends StatelessWidget {
  MessageTile(
      {Key? key,
      required this.image,
      required this.lastMessage,
      required this.name,
      required this.time})
      : super(key: key);
  String image;
  String name;
  String lastMessage;
  String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(const MessageScreen()),
      child: ListTile(
        leading: SizedBox(
          width: 80,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image),
            //clipBehavior: Clip.antiAlias,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Text(lastMessage),
        trailing: Text(time),
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(121, 25, 180, 100),
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 65, 63, 63)),
            ),
            const SizedBox(width: 20),
            Text(
              "Tom P Varghese",
              style: GoogleFonts.montserrat(color: Colors.white),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 15, right: 15.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              style: GoogleFonts.montserrat(fontSize: 18.0),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.add_circle_outlined,
                  color: Colors.black54,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  //prefixIcon: const Icon(Icons.add_circle_outlined,color: Colors.black54,),
                  icon: const Icon(Icons.send, color: Colors.black54),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
