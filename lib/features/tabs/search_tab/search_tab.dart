import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';
import 'package:movies_app/features/tabs/search_tab/cubit/search_tab_states.dart';
import 'package:movies_app/features/tabs/search_tab/cubit/search_tab_view_model.dart';
import 'package:movies_app/features/widgets/custom_movie_poster.dart';
import 'package:movies_app/features/widgets/custom_toast.dart';
import 'package:movies_app/features/widgets/main_loading.dart';
import '../../widgets/custom_text_form_filed.dart';
import 'dart:async';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  late final PagingController<int, Movie> _pagingController = PagingController<int, Movie>(
    getNextPageKey: (state) {
      if (state.lastPageIsEmpty) return null;
      return (state.nextIntPageKey ?? 0) + 1;
    },
    fetchPage: (pageKey) async {
      final cubit = context.read<SearchTabViewModel>();
      await cubit.getMoviesList(
        page: pageKey,
        queryTerm: _searchController.text,
      );
      return cubit.newMovies ?? [];
    },
  );

  @override
  void dispose() {
    _searchController.dispose();
    _pagingController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.04,
          ),
          child: BlocListener<SearchTabViewModel, SearchTabStates>
            (listener: (context, state) {
            if (state is SearchTabErrorState) {
              CustomToast.showErrorToast(context, state.appException.message);

            }
          },
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomTextFormFiled(
                controller: _searchController,
                prefixIcon: AppAssets.searchIconSvg,
                onChanged: (value) {
                  setState(() {});
                  if (_debounce?.isActive ?? false) {
                    _debounce!.cancel();
                  }
                  _debounce = Timer(
                    const Duration(milliseconds: 1000),
                        () {
                      _pagingController.refresh();
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: _searchController.text.isEmpty
                      ? Center(
                    child: Image.asset(
                      AppAssets.popCorn,
                      height: screenHeight * 0.15,
                    ),
                  )
                      : PagingListener(
                    controller: _pagingController,
                    builder: (context, state, fetchNextPage) {
                      return PagedGridView<int, Movie>(
                        state: state,
                        fetchNextPage: fetchNextPage,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        builderDelegate:
                        PagedChildBuilderDelegate<Movie>(
                          itemBuilder: (context, movie, index) {
                            return CustomMoviePoster(
                              imageString: movie.mediumCoverImage??'',
                              rating: movie.rating.toString(),
                            );
                          },
                          firstPageProgressIndicatorBuilder: (_) =>
                          const MainLoading(),
                          newPageProgressIndicatorBuilder: (_) =>
                          const MainLoading(),
                          noItemsFoundIndicatorBuilder: (_) =>
                           Center(
                            child: Image.asset(
                              AppAssets.popCorn,
                              height: screenHeight * 0.15,
                            ),
                          ),
                          firstPageErrorIndicatorBuilder: (_) =>
                           Center(
                            child: Image.asset(
                              AppAssets.popCorn,
                              height: screenHeight * 0.15,
                            ),
                          ),
                          newPageErrorIndicatorBuilder: (_) =>
                           Center(
                            child:Image.asset(
                              AppAssets.popCorn,
                              height: screenHeight * 0.15,
                            ),
                          ),
                        ),
                      );
                    },
                  )
              ),
            ],
          ),
          )
          ),
        ),
      );
  }
}
