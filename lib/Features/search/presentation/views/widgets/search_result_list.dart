import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/styles.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              width: 90,
              height: 130,
              fit: BoxFit.cover,
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.volumeInfo.title ?? "No Title Available",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                ),
                const SizedBox(height: 5),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  (bookModel.volumeInfo.authors != null &&
                          bookModel.volumeInfo.authors!.isNotEmpty)
                      ? bookModel.volumeInfo.authors!.first
                      : "Unknown Author",
                  style: Styles.textStyle14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
