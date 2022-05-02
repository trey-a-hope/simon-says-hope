import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/extensions/hex_color.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Proceed to main page after 3 seconds.
    Timer(
      Duration(seconds: 3),
      () => Get.offAllNamed(Globals.ROUTES_HOME),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              HexColor('0E8DF5'),
              HexColor('17CB89'),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Simon Says Hope',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'How are you feeling?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
