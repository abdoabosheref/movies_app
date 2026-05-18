import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/movie_details_screen/widgets/cast_item.dart';

import '../../../../domain/entities/movie_details/cast.dart';

class CastListView extends StatelessWidget {
  final List<Cast> castList;
  const CastListView({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: castList.length,
      itemBuilder: (context, index) {
        final actor = castList[index];
        return CastItem(image:
        actor.urlSmallImage ?? '',name:
        actor.name ?? 'Unknown',character:
        actor.characterName ?? '',
        );
      },
    );
  }
}
