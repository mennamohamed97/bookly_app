import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../home/data/models/book_model/book_model.dart';
part 'search_by_title_state.dart';

class SearchByTitleCubit extends Cubit<SearchByTitleState> {
  SearchByTitleCubit(this.searchRepo) : super(SearchByTitleInitial());
  final SearchRepo searchRepo;

  Future<void> searchByTitle({required String title}) async {
    emit(SearchByTitleLoading());
    var result = await searchRepo.searchByTitle(title: title);
    result.fold(
      (failure) {
        emit(SearchByTitleFailure(failure.errMessage));
      },
      (books) {
        emit(SearchByTitleSuccess(books));
      },
    );
  }

  void clearSearch() {
    emit(SearchByTitleInitial());
  }
}
