import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_fx_seller/view/screens/onboard_screen/splash_screen.dart';
import 'package:freelance_fx_seller/view/screens/seller_screen/service_creation/service_creation.dart';
import 'package:get/get.dart';

Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Freelance_fx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

