import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/location_search_entity.dart';

part 'location_search_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationSearchModel extends LocationSearch {
  const LocationSearchModel({
    int? id,
    required String title,
    required String locationType,
    required int woeid,
  }) : super(
          id: id,
          title: title,
          locationType: locationType,
          woeid: woeid,
        );

  factory LocationSearchModel.fromJson(Map<String, dynamic> json) =>
      _$LocationSearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationSearchModelToJson(this);

  LocationSearchModel copy({
    int? id,
    String? title,
    String? locationType,
    int? woeid,
  }) =>
      LocationSearchModel(
          id: id ?? this.id,
          title: title ?? this.title,
          locationType: locationType ?? this.locationType,
          woeid: woeid ?? this.woeid);
}

// Data base
class LocationSearchFields {
  static const String tableName = "locationSearch";
  static const List<String> values = [
    id,
    title,
    locationType,
    woeid,
  ];

  static const String id = "_id";
  static const String title = "title";
  static const String locationType = "locationType";
  static const String woeid = "woeid";
}
