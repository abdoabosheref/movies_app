import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_text_form_filed.dart';
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
            horizontal: context.screenWidth * 0.04,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Search Bar
              CustomTextFormFiled(
                prefixIcon: AppAssets.searchIconSvg,
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
