import 'package:flutter/material.dart';
import 'OptionsPage.dart';

class LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OptionsPage()),
            );
          },
          child: Image.asset(
            'assets/images/linkedin.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
