import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/mvvm/models/movie_model.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';

import '../../widgets/details_screen_widget/buildCastItem.dart';
import '../../widgets/details_screen_widget/buildGenreChip.dart';
import '../../widgets/details_screen_widget/buildSectionTitle.dart';
import '../../widgets/details_screen_widget/buildStatItem.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Receiving movie data from arguments
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Background + Icons
            Stack(
              children: [
                Image.asset(
                  movie.image,
                  width: double.infinity,
                  height: context.screenHeight * 0.7,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: context.screenHeight * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.blackOpacity70,
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.037, vertical: context.screenHeight * 0.007),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            // Action when clicking the bookmark icon
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Bookmarked ${movie.title}".tr())),
                            );
                          },
                          icon: SvgPicture.asset(AppAssets.bookMark,),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Action when clicking the play button
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Playing ${movie.title} trailer...".tr())),
                        );
                      },
                      child: Container(
                        width: context.screenWidth * 0.22,
                        height: context.screenHeight * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.yellow,
                            width: 6,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white, width:6),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: AppStyles.white20BoldRoboto,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.year,
                    style: AppStyles.white16RegularRoboto.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    onPressed: () {},
                    backgroundColor: AppColors.red,
                    child: Text("Watch",
                        style: AppStyles.white20BoldRoboto),
                  ),
                  const SizedBox(height: 16),
                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildStatItem(AppAssets.likes, movie.likes, onTap: () {}),
                      buildStatItem(AppAssets.time, movie.duration, onTap: () {}),
                      buildStatItem(AppAssets.rating, movie.rating, onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),

            buildSectionTitle("screen_shots".tr()),
            // ScreenShots Section

            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.037),
              child: SizedBox(
                height: context.screenHeight * 0.622,
                width: context.screenWidth * 0.92,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    movie.screenShots.length,
                        (index) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(movie.screenShots[index],),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle("similar".tr()),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.037),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(AppAssets.watchNowImage, fit: BoxFit.cover),
              ),
            ),

            buildSectionTitle("summary".tr()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.037),
              child: Text(
                movie.summary,
                style: AppStyles.white16RegularRoboto,
                textAlign: TextAlign.justify,
              ),
            ),

            buildSectionTitle("cast".tr()),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.037),
              itemCount: movie.cast.length,
              itemBuilder: (context, index) => buildCastItem(
                movie.cast[index].image,
                movie.cast[index].name,
                movie.cast[index].character,
              ),
            ),

            buildSectionTitle("genres".tr()),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.037, vertical: context.screenHeight * 0.01),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: movie.genres.map((genre) => buildGenreChip(genre.tr())).toList(),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}