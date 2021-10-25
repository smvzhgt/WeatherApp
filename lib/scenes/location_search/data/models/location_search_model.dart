import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/location_search_entity.dart';

part 'location_search_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationSearchModel extends LocationSearch {
  const LocationSearchModel({
    required String title,
    required String locationType,
    required int woeid,
  }) : super(title: title, locationType: locationType, woeid: woeid);

  factory LocationSearchModel.fromJson(Map<String, dynamic> json) =>
      _$LocationSearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationSearchModelToJson(this);
}
