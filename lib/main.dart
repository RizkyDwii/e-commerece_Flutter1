import 'package:flutter/material.dart';
import 'package:skl_pertama_for_real/pages/Chatpage.dart';
import 'package:skl_pertama_for_real/pages/HomePage.dart';
import 'package:skl_pertama_for_real/pages/LoginPage.dart';
import 'package:skl_pertama_for_real/pages/Register.dart';
import 'package:skl_pertama_for_real/pages/cartPage.dart';
import 'package:skl_pertama_for_real/pages/itemPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/": (context) => Homepage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage(),
        "/Homepage": (context) => Homepage(),
        "/Loginpage": (context) => Loginpage(),
        "/Registerpage": (context) => Registerpage(),
        "/Chatpage": (context) => Chatpage(),
      },

    );
  }
}