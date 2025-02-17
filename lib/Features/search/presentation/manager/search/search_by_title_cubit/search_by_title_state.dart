part of 'search_by_title_cubit.dart';

abstract class SearchByTitleState {
  const SearchByTitleState();

  @override
  List<Object> get props => [];
}

final class SearchByTitleInitial extends SearchByTitleState {}

class SearchByTitleLoading extends SearchByTitleState {}

class SearchByTitleFailure extends SearchByTitleState {
  final String errMessage;

  const SearchByTitleFailure(this.errMessage);
}

class SearchByTitleSuccess extends SearchByTitleState {
  final List<BookModel> books;

  const SearchByTitleSuccess(this.books);
}
