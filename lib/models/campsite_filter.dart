import 'package:flutter_campsite_app/models/campsite.dart';

class CampsiteFilter {
  final bool? campfireAllowed;
  final List<String>? languages;
  final List<String>? suitableFor;

  const CampsiteFilter({
    this.campfireAllowed,
    this.languages,
    this.suitableFor,
  });

  bool matches(Campsite campsite) {
    if (campfireAllowed != null &&
        campsite.isCampFireAllowed != campfireAllowed) {
      return false;
    }
    if (languages != null && languages!.isNotEmpty) {
      // At least one language must match
      if (!languages!
          .any((langCode) => campsite.hostLanguages.contains(langCode))) {
        return false;
      }
    }
    if (suitableFor != null && suitableFor!.isNotEmpty) {
      // At least one suitableFor must match
      if (!suitableFor!.any((item) => campsite.suitableFor.contains(item))) {
        return false;
      }
    }
    return true;
  }

  CampsiteFilter copyWith({
    bool? campfireAllowed,
    List<String>? languages,
    List<String>? suitableFor,
  }) {
    return CampsiteFilter(
      campfireAllowed: campfireAllowed ?? this.campfireAllowed,
      languages: languages ?? this.languages,
      suitableFor: suitableFor ?? this.suitableFor,
    );
  }
}
