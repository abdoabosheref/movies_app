import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/mvvm/views/ui/widgets/main_loading.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageString;
  final bool isBackground;
  final double borderRadius;
  const CustomCachedNetworkImage({super.key, required this.imageString,this.isBackground = false, this.borderRadius = 16});



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageString,
        width: isBackground?double.infinity:null,
        height: isBackground?context.screenHeight*0.7:null,
        fit: .fill,
        placeholder: (context, url) => MainLoading(),
        errorWidget: (context, url, error) =>
            Icon(Icons.broken_image, color: AppColors.yellow, size: 50,),
      ),
    );
  }
}
