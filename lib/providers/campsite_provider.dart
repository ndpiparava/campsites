import 'package:flutter_campsite_app/models/campsite_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/campsite.dart';
import '../services/campsite_service.dart';

final campsiteServiceProvider = Provider((ref) => CampsiteService());
final campsiteFilterProvider =
    StateProvider<CampsiteFilter>((ref) => const CampsiteFilter());

final campsiteListProvider = FutureProvider<List<Campsite>>((ref) async {
  final service = ref.read(campsiteServiceProvider);
  final list = await service.fetchCampsites();
  list.sort((a, b) => a.label.compareTo(b.label));
  return list;
});

final filteredCampsiteListProvider = Provider<List<Campsite>>((ref) {
  final campsitesAsync = ref.watch(campsiteListProvider);
  final filter = ref.watch(campsiteFilterProvider);

  return campsitesAsync.when(
    data: (campsites) {
      final filtered =
          campsites.where((campsite) => filter.matches(campsite)).toList();
      filtered.sort((a, b) => a.label.compareTo(b.label));
      return filtered;
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
