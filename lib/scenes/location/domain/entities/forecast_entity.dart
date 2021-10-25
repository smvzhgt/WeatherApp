import 'package:equatable/equatable.dart';
import 'weather_entity.dart';
import 'parent_entity.dart';
import 'source_entity.dart';

class ForecastEntity extends Equatable {
  final List<WeatherEntity> consolidatedWeather;
  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;
  final String timezone;
  final String time;
  final String sunRise;
  final String sunSet;
  final String timezoneName;
  final ParentEntity parent;
  final List<SourceEntity> sources;

  const ForecastEntity({
    required this.consolidatedWeather,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.sources,
  });

  const ForecastEntity.empty({
    this.consolidatedWeather = const [],
    this.title = '',
    this.locationType = '',
    this.woeid = 0,
    this.lattLong = '',
    this.timezone = '',
    this.time = '',
    this.sunRise = '',
    this.sunSet = '',
    this.timezoneName = '',
    this.parent = const ParentEntity.empty(),
    this.sources = const [],
  });

  @override
  List<Object?> get props => [
        consolidatedWeather,
        title,
        locationType,
        woeid,
        lattLong,
        timezone,
        time,
        sunRise,
        sunSet,
        timezoneName,
        parent,
        sources,
      ];
}
