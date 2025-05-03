import 'package:flutter/material.dart';
import 'package:new_project/login.dart';
import 'package:new_project/signup.dart';
import 'package:new_project/splashscreen.dart';
// import 'package:new_project/productdetails.dart';
import 'package:new_project/product.dart';
import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/': (context) => Signup(),
        '/products': (context) => Products(),
        // '/productdetails': (context) => ProductDetailsScreen(),
        '/login': (context) => Login(),
        '/home': (context) => HomeScreen(),
        '/splash': (context) => SplashScreen(),
      },
    ),
  );
}
