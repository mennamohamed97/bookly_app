import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';

class NoSearch extends StatelessWidget {
  const NoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 200, child: Image.asset("assets/images/search.png")),
          const SizedBox(height: 60),
          Text(
            'Find your book now',
            style: Styles.textStyle20.copyWith(color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
