import 'package:flutter/material.dart';

class Custom_Carousel extends StatefulWidget {
  const Custom_Carousel({super.key});

  @override
  State<Custom_Carousel> createState() => _Custom_CarouselState();
}

class _Custom_CarouselState extends State<Custom_Carousel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // ignore: avoid_unnecessary_containers
          body: Container(
              child: Column(children: [
        GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              if (details.velocity.pixelsPerSecond.dx > 0) {
              } else if (details.velocity.pixelsPerSecond.dx < 0) {}
            },
            child: Container(
                height: 500,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/3_500.jpg'),
                        fit: BoxFit.cover)))),
      ]))),
    );
  }
}
