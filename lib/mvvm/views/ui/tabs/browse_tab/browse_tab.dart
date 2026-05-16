import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_movie_poster.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../models/movie_model.dart';


class BrowseTab extends StatelessWidget {

  final List<String> categories = [
    'action',
    'adventure',
    'animation',
    'Biography',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          spacing: 25,
          children: [
            SizedBox(
              height: 48,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        //todo:    selectedIndex = index;
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: const Duration(milliseconds: 200),
                        // أنيميشن خفيف عند الانتقال
                        padding: const EdgeInsets.symmetric(
                          horizontal: 19,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.yellow
                              : AppColors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColors.yellow, width: 2),
                        ),
                        child: Text(
                          categories[index],
                          style: isSelected
                              ? AppStyles.darkBlack20BoldInter
                              : AppStyles.yellow20BoldInter,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  childAspectRatio: 9 / 12,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (contex, index) {
                  return InkWell(
                    onTap: () {
                      final mockMovie = Movie(
                        title: "1917 Movie ${index + 1}",
                        year: "2019",
                        rating: "9.0",
                        duration: "2h  dynamics",
                        likes: "4.5k",
                        summary: "Two young British soldiers during the First World War are given an impossible mission.",
                        image: AppAssets.onBoarding6, // الصورة الثابتة التي تستخدمها
                        screenShots: [AppAssets.onBoarding6, AppAssets.onBoarding6], // صور الشاشة
                        cast: [
                          Cast(name: "George MacKay", character: "Lance Corporal Schofield", image: AppAssets.onBoarding6),
                          Cast(name: "Dean-Charles Chapman", character: "Lance Corporal Blake", image: AppAssets.onBoarding6),
                        ],
                        genres: ["Action", "Drama", "War"],
                      );
                      Navigator.of(context).pushNamed(AppRoutes.movieDetailsScreen,arguments:mockMovie );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CustomMoviePoster(
                          imageString: AppAssets.onBoarding6, rating: "9"),
                    ),
                  );
                },
              ),
            ),

            // هنا يمكنك إضافة الـ GridView أو الـ ListView لعرض الأفلام بالأسفل
          ],
        ),
      ),
    );
  }
}
