import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/source_entity.dart';

part 'source_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SourceModel extends SourceEntity {
  const SourceModel({
    required String title,
    required String slug,
    required String url,
    required int crawlRate,
  }) : super(
          title: title,
          slug: slug,
          url: url,
          crawlRate: crawlRate,
        );

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
