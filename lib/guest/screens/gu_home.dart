import 'package:flutter/material.dart';

class GuestHome extends StatelessWidget {
  const GuestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest'),
      ),
      body: const Center(
        child: Text(
          'Guest YYYYYyyyy',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
