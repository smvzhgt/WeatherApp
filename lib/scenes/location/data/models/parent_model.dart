import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/parent_entity.dart';

part 'parent_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ParentModel extends ParentEntity {
  const ParentModel({
    required String title,
    required String locationType,
    required int woeid,
    required String lattLong,
  }) : super(
          title: title,
          locationType: locationType,
          woeid: woeid,
          lattLong: lattLong,
        );

  factory ParentModel.fromJson(Map<String, dynamic> json) =>
      _$ParentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParentModelToJson(this);
}
