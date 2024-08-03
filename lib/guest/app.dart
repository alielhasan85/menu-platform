import 'package:digital_menu/guest/screens/gu_home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guest interface',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const GuestHome(),
    );
  }
}
