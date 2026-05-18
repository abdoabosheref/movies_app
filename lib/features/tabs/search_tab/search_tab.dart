import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_lists.dart';
import 'package:movies_app/core/utils/app_routes.dart';

import '../../../../../core/utils/app_context.dart';
import '../../widgets/custom_movie_poster.dart';
import '../../widgets/custom_text_form_filed.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
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
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Search Bar
              CustomTextFormFiled(
                controller: _searchController,
                prefixIcon: AppAssets.searchIconSvg,
                onChanged: (value) {
                  setState(() {});
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
                    : GridView.builder(
                  itemCount: AppLists.dummyMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final movie = AppLists.dummyMovies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.movieDetailsScreen,
                          arguments: movie,
                        );
                      },
                      child: CustomMoviePoster(
                          imageString: movie.image,
                          rating: movie.rating),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
