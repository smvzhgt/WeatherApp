import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required int id,
    required String weatherStateName,
    required String weatherStateAbbr,
    required String windDirectionCompass,
    required String created,
    required String applicableDate,
    required double minTemp,
    required double maxTemp,
    required double theTemp,
    required double windSpeed,
    required double windDirection,
    required double airPressure,
    required int humidity,
    required double visibility,
    required int predictability,
  }) : super(
          id: id,
          weatherStateName: weatherStateName,
          weatherStateAbbr: weatherStateAbbr,
          windDirectionCompass: windDirectionCompass,
          created: created,
          applicableDate: applicableDate,
          minTemp: minTemp,
          maxTemp: maxTemp,
          theTemp: theTemp,
          windSpeed: windSpeed,
          windDirection: windDirection,
          airPressure: airPressure,
          humidity: humidity,
          visibility: visibility,
          predictability: predictability,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
