import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/lottie/noResult.json"));
  }
}
