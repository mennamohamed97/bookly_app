import 'package:bookly/Features/home/presentation/views/widgets/home_widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/styles.dart';

class BookData extends StatelessWidget {
  const BookData(
      {super.key,
      required this.bookTitle,
      required this.bookAuthor,
      required this.bookRating});
  final String bookTitle;
  final String bookAuthor;
  final num bookRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bookTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle20.copyWith(
              fontFamily: kGtSectraFine,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            maxLines: 1,
            bookAuthor,
            style: Styles.textStyle14,
          ),
          StarRating(
            rating: bookRating,
          )
        ],
      ),
    );
  }
}
