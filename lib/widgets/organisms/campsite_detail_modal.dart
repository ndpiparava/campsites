import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/widgets/atoms/campsite_image.dart';
import '../../models/campsite.dart';
import '../atoms/campsite_detail_row.dart'; // import your new small widget

class CampsiteDetailModal extends StatelessWidget {
  final Campsite campsite;

  const CampsiteDetailModal({Key? key, required this.campsite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double modalHeight = MediaQuery.of(context).size.height * 0.9;

    return SizedBox(
      height: modalHeight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campsite.label,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CachedCampsiteImage(
                        imageUrl: campsite.photo,
                        width: double.infinity,
                        height: 200),
                    const SizedBox(height: 20),
                    DetailRow(
                      label: 'Price per night:',
                      detail: '€${campsite.pricePerNight.toStringAsFixed(2)}',
                    ),
                    DetailRow(
                      label: 'Languages:',
                      detail: campsite.hostLanguages.join(', '),
                    ),
                    DetailRow(
                      label: 'Suitable for:',
                      detail: campsite.suitableFor.join(', '),
                    ),
                    DetailRow(
                      label: 'Campfires:',
                      detail: campsite.isCampFireAllowed ? 'Yes 🔥' : 'No 🚫',
                    ),
                    DetailRow(
                      label: 'Location:',
                      detail:
                          'lat ${campsite.geoLocation.lat}, lng ${campsite.geoLocation.long}',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
