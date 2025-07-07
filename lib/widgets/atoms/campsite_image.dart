// lib/widgets/atoms/cached_campsite_image.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_campsite_app/styles/theme.dart';

class CachedCampsiteImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;

  const CachedCampsiteImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: AppTheme.colors.grey,
          width: width,
          height: height,
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        errorWidget: (context, url, error) => Container(
          color: AppTheme.colors.grey,
          width: width,
          height: height,
          child: Icon(Icons.error, color: AppTheme.colors.danger),
        ),
      ),
    );
  }
}
