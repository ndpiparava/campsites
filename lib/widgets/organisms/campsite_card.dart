import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/widgets/atoms/campsite_image.dart';
import '../../models/campsite.dart';
import 'campsite_detail_modal.dart';
import '../../styles/theme.dart';

class CampsiteCard extends StatelessWidget {
  final Campsite campsite;

  const CampsiteCard({super.key, required this.campsite});

  void _showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => CampsiteDetailModal(campsite: campsite),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: () => _showDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedCampsiteImage(
                  imageUrl: campsite.photo,
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campsite.label,
                      style: AppTheme.textStyles.bodyMediumBold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '€${campsite.pricePerNight.toStringAsFixed(2)} / night',
                      style: AppTheme.textStyles.bodyMedium,
                    ),
                    Text(
                      'Languages: ${campsite.hostLanguages.join(', ')}',
                      style: AppTheme.textStyles.bodyMedium,
                    ),
                    if (campsite.isCampFireAllowed)
                      Text(
                        'Campfires allowed 🔥',
                        style: AppTheme.textStyles.bodyMediumGreen,
                      )
                    else
                      Text(
                        'No campfires 🚫',
                        style: AppTheme.textStyles.bodyMediumRed,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
