import 'package:flutter/material.dart';

import 'widget.dart';

class Custom_Carousel extends StatefulWidget {
  const Custom_Carousel({super.key});

  @override
  State<Custom_Carousel> createState() => _Custom_CarouselState();
}

class _Custom_CarouselState extends State<Custom_Carousel> {
  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _prev() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

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
                _prev();
              } else if (details.velocity.pixelsPerSecond.dx < 0) {
                _next();
              }
            },
            child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(products[currentIndex][0]),
                      fit: BoxFit.cover),
                ),
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.grey.shade700.withOpacity(.9),
                          Colors.grey.withOpacity(.0),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            width: 70,
                            child: Row(
                              children: [],
                            ))
                      ],
                    )))),
      ]))),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
        child: Container(
      height: 4,
      margin: const EdgeInsets.only(right: 5),
    ));
  }
}
