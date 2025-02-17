import 'package:flutter/material.dart';
import 'package:bookly/core/utils/assets.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Column(
              children: [
                Image.asset(
                  AssetsData.booklyLogo,
                  color: Colors.black,
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Read Freely, Dream Endlessly',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }
}
