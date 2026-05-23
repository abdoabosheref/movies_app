import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/features/screens/movie_details/firebase/watchlist_firebase_service.dart';
import 'package:movies_app/features/widgets/custom_movie_poster.dart';

class WatchListTabBar extends StatelessWidget {
  const WatchListTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
    );
  }
}
