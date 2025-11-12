import 'package:flutter/material.dart';
import 'package:food_delivery_application/app_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:app_01_page(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        useMaterial3: false,
        primarySwatch: Colors.yellow,

        ),
    );
  }
}





