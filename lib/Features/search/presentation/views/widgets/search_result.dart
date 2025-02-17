import 'package:bookly/Features/search/presentation/views/widgets/no_search.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_loading.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_result_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/Features/search/presentation/manager/search/search_by_title_cubit/search_by_title_cubit.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchByTitleCubit, SearchByTitleState>(
      builder: (context, state) {
        if (state is SearchByTitleSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SearchResultList(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchByTitleFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchByTitleLoading) {
          return const SearchLoading();
        } else {
          return const NoSearch();
        }
      },
    );
  }
}
