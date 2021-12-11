import '../../domain/entities/location_search_entity.dart';

class LocationSearchModel extends LocationSearch {
  LocationSearchModel({
    int? id,
    required String title,
    required String locationType,
    required int woeid,
    required bool isFavorite,
  }) : super(
          id: id,
          title: title,
          locationType: locationType,
          woeid: woeid,
          isFavorite: isFavorite,
        );

  factory LocationSearchModel.fromJson(Map<String, dynamic> json) {
    return LocationSearchModel(
        id: (json['id'] ?? 0) as int,
        title: json['title'] as String,
        locationType: json['location_type'] as String,
        woeid: json['woeid'] as int,
        isFavorite: json['is_favorite'] == 1);
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id ?? 0,
      'title': title,
      'location_type': locationType,
      'woeid': woeid,
      'is_favorite': isFavorite ? 1 : 0,
    };
  }

  LocationSearchModel copy({
    int? id,
    String? title,
    String? locationType,
    int? woeid,
    bool? isFavorite,
  }) =>
      LocationSearchModel(
        id: id ?? this.id,
        title: title ?? this.title,
        locationType: locationType ?? this.locationType,
        woeid: woeid ?? this.woeid,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}

// Data base
class LocationSearchFields {
  static const String tableName = "locationSearch";
  static const List<String> values = [
    id,
    title,
    locationType,
    woeid,
    isFavorite
  ];

  static const String id = "id";
  static const String title = "title";
  static const String locationType = "location_type";
  static const String woeid = "woeid";
  static const String isFavorite = "is_favorite";
}
