import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'client/app.dart' as clientApp;
import 'guest/app.dart' as guestApp;
import 'admin/app.dart' as adminApp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ensure that Flutter's binding is initialized

  // Initialize Firebase

  await dotenv.load(fileName: ".env");

  String appType = dotenv.env['APP_TYPE'] ?? 'client';

  runApp(MyApp(appType: appType));
}

class MyApp extends StatelessWidget {
  final String appType;

  const MyApp({super.key, required this.appType});

  @override
  Widget build(BuildContext context) {
    if (appType == 'client') {
      return const clientApp.MyApp();
    } else if (appType == 'guest') {
      return const guestApp.MyApp();
    } else if (appType == 'admin') {
      return const adminApp.MyApp();
    } else {
      return Container(); // Or a default app/screen if needed
    }
  }
}
