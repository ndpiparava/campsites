class GeoLocation {
  final double lat;
  final double long;

  static const GeoLocation defaultGermanCenter = GeoLocation(
    lat: 51.1657,
    long: 10.4515,
  );

  const GeoLocation({
    required this.lat,
    required this.long,
  });

  factory GeoLocation.fromJson(Map<String, dynamic>? json) {
    final rawLat = (json?['lat'] as num?)?.toDouble();
    final rawLong = (json?['long'] as num?)?.toDouble();

    final isLatValid = rawLat != null && rawLat >= -90 && rawLat <= 90;
    final isLongValid = rawLong != null && rawLong >= -180 && rawLong <= 180;

    if (isLatValid && isLongValid) {
      return GeoLocation(lat: rawLat, long: rawLong);
    } else {
      return GeoLocation.defaultGermanCenter;
    }
  }

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'long': long,
      };
}

class Campsite {
  final String id;
  final String label;
  final String photo;
  final GeoLocation geoLocation;
  final bool isCloseToWater;
  final bool isCampFireAllowed;
  final List<String> hostLanguages;
  final double pricePerNight;
  final List<String> suitableFor;
  final DateTime createdAt;

  Campsite({
    required this.id,
    required this.label,
    required this.photo,
    required this.geoLocation,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.hostLanguages,
    required this.pricePerNight,
    required this.suitableFor,
    required this.createdAt,
  });

  factory Campsite.fromJson(Map<String, dynamic> json) {
    return Campsite(
      id: json['id'] as String,
      label: json['label'] as String,
      photo: json['photo'] as String,
      geoLocation: GeoLocation.fromJson(
        json['geoLocation'] as Map<String, dynamic>?,
      ),
      isCloseToWater: json['isCloseToWater'] as bool,
      isCampFireAllowed: json['isCampFireAllowed'] as bool,
      hostLanguages: List<String>.from(json['hostLanguages'] as List),
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      suitableFor: List<String>.from(json['suitableFor'] as List),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'photo': photo,
        'geoLocation': geoLocation.toJson(),
        'isCloseToWater': isCloseToWater,
        'isCampFireAllowed': isCampFireAllowed,
        'hostLanguages': hostLanguages,
        'pricePerNight': pricePerNight,
        'suitableFor': suitableFor,
        'createdAt': createdAt.toIso8601String(),
      };
}
