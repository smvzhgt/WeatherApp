import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/parent_entity.dart';

import '../parent_model.dart';

class ParentSerializer implements JsonConverter<ParentEntity, Map> {
  const ParentSerializer();

  @override
  ParentModel fromJson(Map json) {
    return ParentModel(
      title: json['title'] as String,
      locationType: json['location_type'] as String,
      woeid: json['woeid'] as int,
      lattLong: json['latt_long'] as String,
    );
  }

  @override
  Map toJson(ParentEntity object) {
    return <String, dynamic>{
      'title': object.title,
      'location_type': object.locationType,
      'woeid': object.woeid,
      'latt_long': object.lattLong,
    };
  }
}
