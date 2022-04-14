import 'package:flutter/material.dart';
import 'package:flutter_example/screens/landing_screen.dart';
import 'package:flutter_example/screens/web_side/web_login.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return WebLoginScreen();
        } else {
          return LandingScreen();
        }
      },
    );
  }
}