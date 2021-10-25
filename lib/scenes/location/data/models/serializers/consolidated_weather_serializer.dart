import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/weather_entity.dart';

import '../weather_model.dart';

class ConsolidatedWeatherSerializer
    implements JsonConverter<List<WeatherEntity>, Map> {
  const ConsolidatedWeatherSerializer();

  @override
  List<WeatherEntity> fromJson(Map json) {
    final list = json['consolidated_weather'] as List<dynamic>;
    final result = list
        .map(
          (e) => mapToWeather(e as Map<String, dynamic>),
        )
        .toList();
    return result;
  }

  @override
  Map toJson(List<WeatherEntity> object) {
    return <String, dynamic>{
      'consolidated_weather': object.map((entity) {
        final map = weatherToMap(entity);
        return map;
      }).toList(),
    };
  }

  Map<String, dynamic> weatherToMap(WeatherEntity entity) {
    return {
      'id': entity.id,
      'weather_state_name': entity.weatherStateName,
      'weather_state_abbr': entity.weatherStateAbbr,
      'wind_direction_compass': entity.windDirectionCompass,
      'created': entity.created,
      'applicable_date': entity.applicableDate,
      'min_temp': entity.minTemp,
      'max_temp': entity.maxTemp,
      'the_temp': entity.theTemp,
      'wind_speed': entity.windSpeed,
      'wind_direction': entity.windDirection,
      'air_pressure': entity.airPressure,
      'humidity': entity.humidity,
      'visibility': entity.visibility,
      'predictability': entity.predictability,
    };
  }

  WeatherModel mapToWeather(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'] as int,
      weatherStateName: json['weather_state_name'] as String,
      weatherStateAbbr: json['weather_state_abbr'] as String,
      windDirectionCompass: json['wind_direction_compass'] as String,
      created: json['created'] as String,
      applicableDate: json['applicable_date'] as String,
      minTemp: json['min_temp'] as double,
      maxTemp: json['max_temp'] as double,
      theTemp: json['the_temp'] as double,
      windSpeed: json['wind_speed'] as double,
      windDirection: json['wind_direction'] as double,
      airPressure: json['air_pressure'] as double,
      humidity: json['humidity'] as int,
      visibility: json['visibility'] as double,
      predictability: json['predictability'] as int,
    );
  }
}
