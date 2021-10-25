import 'package:equatable/equatable.dart';

import '../../../../core/date_converter.dart';
import '../../../../core/wind_direction_converter.dart';

class WeatherEntity extends Equatable {
  final int id;
  final String weatherStateName;
  final String weatherStateAbbr;
  final String windDirectionCompass;
  final String created;
  final String applicableDate;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final int humidity;
  final double visibility;
  final int predictability;

  const WeatherEntity({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  int get windSpeedFormat => windSpeed.floor();
  int get airPressureFormat => airPressure.floor();
  int get visibilityFormat => visibility.round();
  int get theTempFormat => theTemp.floor();
  int get minTempFormat => minTemp.floor();
  int get maxTempFormat => maxTemp.floor();
  String get windDirectionCompassFormat =>
      WindDirectionConverter().convert(windDirectionCompass);
  String get applicableDateFormat => DateFormatter.format(applicableDate);

  const WeatherEntity.empty(
      {this.id = 0,
      this.weatherStateName = '',
      this.weatherStateAbbr = '',
      this.windDirectionCompass = '',
      this.created = '',
      this.applicableDate = '',
      this.minTemp = 0.0,
      this.maxTemp = 0.0,
      this.theTemp = 0.0,
      this.windSpeed = 0.0,
      this.windDirection = 0.0,
      this.airPressure = 0.0,
      this.humidity = 0,
      this.visibility = 0.0,
      this.predictability = 0});

  @override
  List<Object?> get props => [
        id,
        weatherStateName,
        weatherStateAbbr,
        windDirectionCompass,
        created,
        applicableDate,
        minTemp,
        maxTemp,
        theTemp,
        windSpeed,
        windDirection,
        airPressure,
        humidity,
        visibility,
        predictability
      ];
}
