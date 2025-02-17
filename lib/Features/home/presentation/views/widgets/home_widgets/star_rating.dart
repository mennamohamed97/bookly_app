import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarRating extends StatelessWidget {
  final num rating;

  const StarRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: List.generate(5, (index) {
            double starValue = index + 1.0;
            return Icon(
              starValue <= rating
                  ? FontAwesomeIcons.solidStar
                  : starValue - 0.5 <= rating
                      ? FontAwesomeIcons.starHalfStroke
                      : FontAwesomeIcons.star,
              size: 12,
              color: Colors.amber,
            );
          }),
        ),
        const SizedBox(width: 5),
        Text(
          rating.toStringAsFixed(1),
          style: Styles.textStyle14
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}
