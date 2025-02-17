import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/screen/book_details.dart';
import 'package:bookly/Features/home/presentation/views/screen/home.dart';
import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/Features/search/presentation/manager/search/search_by_title_cubit/search_by_title_cubit.dart';
import 'package:bookly/Features/search/presentation/views/screen/search.dart';
import 'package:bookly/Features/Splash/presentation/Views/screen/splash.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splash()),
      GoRoute(
        path: kSearchView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => SearchByTitleCubit(getIt.get<SearchRepoImpl>()),
              child: SearchView(),
            ),
      ),
      GoRoute(
        path: kHomeView,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) =>
                          FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                            ..fetchFeaturedBooks(),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          NewestBooksCubit(getIt.get<HomeRepoImpl>())
                            ..fetchNewestBooks(),
                ),
              ],
              child: Home(),
            ),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetails(bookModel: state.extra as BookModel),
            ),
      ),
    ],
  );
}
