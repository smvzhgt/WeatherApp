import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/forecast_entity.dart';
import '../../domain/entities/parent_entity.dart';
import 'serializers/consolidated_weather_serializer.dart';
import 'serializers/parent_serializer.dart';
import 'serializers/source_serializer.dart';
import 'source_model.dart';
import 'weather_model.dart';

part 'forecast_model.g.dart';

@SourceSerializer()
@ParentSerializer()
@ConsolidatedWeatherSerializer()
@JsonSerializable(fieldRename: FieldRename.snake)
class ForecastModel extends ForecastEntity {
  const ForecastModel({
    required List<WeatherModel> consolidatedWeather,
    required String title,
    required String locationType,
    required int woeid,
    required String lattLong,
    required String timezone,
    required String time,
    required String sunRise,
    required String sunSet,
    required String timezoneName,
    required ParentEntity parent,
    required List<SourceModel> sources,
  }) : super(
          consolidatedWeather: consolidatedWeather,
          title: title,
          locationType: locationType,
          woeid: woeid,
          lattLong: lattLong,
          timezone: timezone,
          time: time,
          sunRise: sunRise,
          sunSet: sunSet,
          timezoneName: timezoneName,
          parent: parent,
          sources: sources,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
