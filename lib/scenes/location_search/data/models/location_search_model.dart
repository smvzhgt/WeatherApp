import '../../domain/entities/location_search_entity.dart';

class LocationSearchModel extends LocationSearch {
  int? id;
  LocationSearchModel({
    int? id,
    required String title,
    required String locationType,
    required int woeid,
    required bool isFavorite,
  }) : super(
          title: title,
          locationType: locationType,
          woeid: woeid,
          isFavorite: isFavorite,
        );

  factory LocationSearchModel.fromJson(Map<String, dynamic> json) {
    return LocationSearchModel(
        title: json['title'] as String,
        locationType: json['location_type'] as String,
        woeid: json['woeid'] as int,
        isFavorite: json['is_favorite'] == 1);
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
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
