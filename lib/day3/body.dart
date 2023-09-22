import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Liquid extends StatefulWidget {
  const Liquid({super.key});

  @override
  State<Liquid> createState() => _LiquidState();
}

class _LiquidState extends State<Liquid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context){
          return LiquidSwipe(
            pages: pages, 
            fullTransitionValue: 800, waveType: WaveType.circularReveal),
        }));
  }
}
