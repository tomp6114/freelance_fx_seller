import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_fx_seller/authentication/auth_helper.dart';

import 'package:freelance_fx_seller/view/screens/seller_screen/bottom_navigation_seller/bottom_navigation_seller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import '../../../constants/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: kbackgroundpage,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Welcome Back",
          style: GoogleFonts.montserrat(
            color: titleColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formkey,
                child: SizedBox(
                  width: 320,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Color.fromARGB(193, 85, 81, 81),
                        ),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(90, 126, 123, 135),
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
                          labelStyle: TextStyle(color: klabeltext),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (RegExp(
                                  "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                              .hasMatch(value!)) {
                            return null;
                          } else {
                            return "Please provide a valid email address";
                          }
                        },
                      ),
                      kheight20,
                      TextFormField(
                        controller: passwordController,
                        style: const TextStyle(
                          color: ktextformfieldtext,
                        ),
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          //filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kbordertextfield, width: 0.7),
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
                          labelStyle: TextStyle(color: klabeltext),
                        ),
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Please provide atleast 8 characters";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                      ),
                      kHeight200,
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(titleColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ))),
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            String res = await AuthMethods().signInUser(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                                Get.showSnackbar(GetSnackBar(title: 'Message',message: res,duration: Duration(seconds: 3),));
                                if(res=='Logged In Sucessfully'){
                                  Get.off(BottomNavigationSeller());
                                }
                          }else{

                          }
                          //signIn(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 57,
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      kheight20,
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(kblack),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          AuthMethods().googleSignIn();
                        },
                        child: SizedBox(
                          //alignment: Alignment.center,
                          height: 57,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Image.asset(
                                      "assets/images/google_logo.png"),
                                ),
                              ),
                              kwidth20,
                              const Text(
                                'Sign in with Google',
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
                ),
              )
            ],
          ),
          color: kbackgroundpage,
        ),
      ),
    );
  }

  

  // Future signIn(BuildContext context) async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     ).then((value) => Get.off(()=>BottomNavigationSeller()));
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     Utils.showSnackBar(e.message);
  //   }

  //   //await FirebaseAuth.instance.s
  // }

  // Future googleSignIn() async{
  //   final googleUser= await googleSignIn;
  //   if(googleUser==null){
  //     return;
  //   }
  //   final googleAuth= await googleUser.authentication;
  //   var _user= googleUser;
  //   final credential= GoogleAuthProvider.credential(accessToken: googleAuth.acc)
  // }
}
