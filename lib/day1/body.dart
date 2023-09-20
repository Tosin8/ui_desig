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
                            margin: const EdgeInsets.only(bottom: 60),
                            child: Row(
                              children: _buildIndicator(),
                            ))
                      ],
                    )))),
        Expanded(
            child: Transform.translate(
                offset: const Offset(0, -40),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[currentIndex][1],
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 42,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              products[currentIndex][2],
                              style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    size: 18, color: Colors.yellow.shade700),
                                Icon(Icons.star,
                                    size: 18, color: Colors.yellow.shade700),
                                Icon(Icons.star,
                                    size: 18, color: Colors.yellow.shade700),
                                Icon(Icons.star,
                                    size: 18, color: Colors.yellow.shade700),
                                Icon(Icons.star_half,
                                    size: 18, color: Colors.yellow.shade700),
                              ],
                            )
                          ],
                        )
                      ],
                    ))))
      ]))),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive ? Colors.grey.shade800 : Colors.white),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == 1) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
