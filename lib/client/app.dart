import 'package:digital_menu/client/screens/cl_home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client interface',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ClientHome(),
    );
  }
}
