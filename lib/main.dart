import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:serene/screens/auth_screens/login_screen.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:serene/screens/homescreen/homescreen.dart';

void main() async {
  runApp(const MyApp());
}

bool isLogedIn() {
  bool logged = true;
  return logged;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.grey[50],
          // scaffoldBackgroundColor: Colors.cyan[100],
        ),
        home: isLogedIn() ? LoginScreen() : HomeScreen());
  }
}
