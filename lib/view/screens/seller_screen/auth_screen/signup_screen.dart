import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_fx_seller/authentication/auth_helper.dart';
import 'package:freelance_fx_seller/view/constants/size.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants/colors.dart';
import '../../../constants/utils.dart';
import '../bottom_navigation_seller/bottom_navigation_seller.dart';
import '../service_creation/service_creation.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailContr = TextEditingController();
  TextEditingController fullnameContr = TextEditingController();
  TextEditingController passwordContr = TextEditingController();
  TextEditingController phoneContr = TextEditingController();
  String verficationIdreceived = "";
  XFile? _image;
  dynamic imagePath;

  final formkey = GlobalKey<FormState>();
  Future getImage() async {
    final ImagePicker image = ImagePicker();
    _image = await image.pickImage(source: ImageSource.gallery);

    setState(() {
      if (_image != null) {
        imagePath = _image!.path;
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Create an Account",
          style: GoogleFonts.montserrat(
              color: titleColor, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(205, 246, 243, 243),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(205, 246, 243, 243)),
          child: Column(
            children: [
              Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 320,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            _image == null
                                ? const CircleAvatar(
                                    radius: 75,
                                    backgroundColor: Colors.grey,
                                    child: Text(
                                      "Add Image",
                                      style: TextStyle(color: kVoliet),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      //Get.to(ViewImage(imagepath: imagePath));
                                    },
                                    child: ClipOval(
                                      child: Image.file(
                                        File(imagePath),
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: CircleAvatar(
                                backgroundColor: kblack.withOpacity(0.2),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: kblack,
                                  ),
                                  onPressed: getImage,
                                ),
                              ),
                            ),
                          ],
                        ),
                        kheight20,
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(90, 126, 123, 135),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            labelText: "Full name",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(114, 61, 59, 59)),
                          ),
                          controller: fullnameContr,
                          validator: (value) {
                            if (value!.length < 3) {
                              return "Please provide atleast 3 characters";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            //name = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            //fillColor: Color.fromARGB(255, 151, 30, 30),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(90, 126, 123, 135),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),

                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(114, 61, 59, 59),
                            ),
                          ),
                          controller: emailContr,
                          // onChanged: (value) {
                          //   //email = value;
                          // },
                          validator: (value) {
                            if (RegExp(
                                    "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                                .hasMatch(value!)) {
                              return null;
                            } else {
                              return "please provide a valid email address";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(90, 126, 123, 135),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            labelText: "Phone",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(114, 61, 59, 59)),
                          ),
                          controller: phoneContr,
                          // onChanged: (value) {
                          //   // phone = value;
                          // },
                          validator: (value) {
                            if (value!.length < 10) {
                              return "Enter a valid number";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(90, 126, 123, 135),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(114, 61, 59, 59)),
                          ),
                          controller: passwordContr,
                          // onChanged: (value) {
                          //   // password = value;
                          // },
                          validator: (value) {
                            if (value!.length < 6) {
                              return "please provide atleast 8 characters";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(titleColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              final res = await AuthMethods().signUpUser(
                                  email: emailContr.text.trim(),
                                  password: passwordContr.text.trim(),
                                  fullName: fullnameContr.text.trim(),
                                  mobileNumber: phoneContr.text.trim(),
                                  image: imagePath);
                              if (res == 'Sucess') {
                                Get.off(ServiceCreation());
                                Get.showSnackbar(const GetSnackBar(
                                  duration: Duration(seconds: 1),
                                  title: 'Sucess',
                                  message: 'Account Created Sucessfully',
                                ));
                              } else {
                                Get.showSnackbar(const GetSnackBar(
                                  title: 'Error',
                                  message:
                                      'Please check your internet connection',
                                ));
                              }
                            }
                            //signUp(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 57,
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 0, 0, 0)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                          ),
                          onPressed: () {},
                          child: SizedBox(
                            height: 57,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    "assets/images/google_logo.png",
                                    height: 30,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Sign up with Google',
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // Future signUp(BuildContext context) async {
  //   bool showLoading;
  //   final isvalid = formkey.currentState!.validate();
  //   if (!isvalid) return;
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => const Center(
  //             child: CircularProgressIndicator(),
  //           ));
  //   try {

  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailContr.text.trim(), password: passwordContr.text.trim()).then((value) =>  Get.off(()=>BottomNavigationSeller()));

  //   } on FirebaseAuthException catch (e) {
  //     print(e);

  //     Utils.showSnackBar(e.message);
  //   }
  // }
}
