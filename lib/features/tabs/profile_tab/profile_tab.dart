import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/features/tabs/profile_tab/profile_default_tab_controller/profile_tabs_section.dart';
import 'package:movies_app/features/tabs/profile_tab/profile_header/user_profile_header.dart';
import 'package:movies_app/features/tabs/profile_tab/row_of_buttons/profile_row_of_buttons.dart';

import '../../screens/movie_details/firebase/watchlist_firebase_service.dart';
import '../../widgets/custom_movie_poster.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              spacing: screenHeight * 0.02,
              children: [
                UserProfileHeader(),
                ProfileRowOfButtons(),
                ProfileTabsSection(),
                Expanded(
                  child: TabBarView(
                    children: [
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: WatchlistFirebaseService().getWatchlist(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: Image.asset(
                                AppAssets.popCorn,
                                height: screenHeight * 0.15,
                              ),
                            );
                          }

                          var docs = snapshot.data!.docs;

                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              var movieData = docs[index].data();

                              int? id = movieData['id'] is int
                                  ? movieData['id']
                                  : int.tryParse(
                                      movieData['id']?.toString() ?? '',
                                    );

                              String rating =
                                  movieData['rating']?.toString() ?? '0.0';

                              return CustomMoviePoster(
                                imageString: movieData['imageUrl'] ?? '',
                                rating: rating,
                                movieId: id,
                              );
                            },
                          );
                        },
                      ),

                      Center(
                        child: Image.asset(
                          AppAssets.popCorn,
                          height: screenHeight * 0.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
