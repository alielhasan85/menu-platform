import 'package:flutter/material.dart';

class ClientHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client '),
      ),
      body: Center(
        child: Text(
          'welcccc!! ',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
