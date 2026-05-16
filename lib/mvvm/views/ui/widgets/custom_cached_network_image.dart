import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/mvvm/views/ui/widgets/main_loading.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.imageString});

  final String imageString;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageString,
      height: double.infinity,
      width: double.infinity,
      fit: .fill,
      placeholder: (context, url) => MainLoading(),
      errorWidget: (context, url, error) =>
          Icon(Icons.broken_image, color: AppColors.yellow),
    );
  }
}
