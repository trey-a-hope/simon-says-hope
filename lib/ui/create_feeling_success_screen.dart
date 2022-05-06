import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateFeelingSuccessScreen extends StatelessWidget {
  CreateFeelingSuccessScreen({
    Key? key,
  }) : super(key: key);

  ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 10));

  @override
  Widget build(BuildContext context) {
    _confettiController.play();

    // After 3 seconds, close this page.
    Timer(const Duration(seconds: 5), () {
      Get.back();
      Get.back();
    });

    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: pi / 2,
            // radial value - LEFT
            particleDrag: 0.05,
            // apply drag to the confetti
            emissionFrequency: 0.05,
            // how often it should emit
            numberOfParticles: 20,
            // number of particles to emit
            gravity: 0.05,
            // gravity - or fall speed
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink
            ], // manually specify the colors to be used
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your feelings have been heard!',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Come back tomorrow to submit another.',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ]),
    );
  }
}
