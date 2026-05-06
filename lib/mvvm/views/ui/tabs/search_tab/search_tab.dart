import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import '../../../../../core/utils/app_context.dart';
import 'movieGridItem.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.screenHeight * 0.02,
            horizontal: context.screenWidth * 0.037,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Search Bar
              TextField(
                controller: _searchController,
                style: AppStyles.white16RegularRoboto,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppStyles.white16RegularRoboto,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      AppAssets.searchTabIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.darkGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
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
                          width: 200,
                        ),
                      )
                    : GridView.builder(
                        itemCount: 10, // Placeholder count
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return MovieGridItem(
                            // image List
                            image: AppAssets.watchNowImage,
                            //Rate List
                            rate: 7.5,
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
