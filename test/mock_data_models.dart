import 'dart:convert';

import 'package:forecastapp/scenes/location/data/models/forecast_model.dart';

final forecastDataModel = ForecastModel.fromJson(jsonDecode(forecastJsonModel));

const forecastJsonModel = '''
{
  "consolidated_weather": [
    {
      "id": 6051120217587712,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "E",
      "created": "2021-07-27T17:12:04.314228Z",
      "applicable_date": "2021-07-27",
      "min_temp": 18.455,
      "max_temp": 32.11,
      "the_temp": 30.7,
      "wind_speed": 4.124786844826215,
      "wind_direction": 81.5,
      "air_pressure": 1020.0,
      "humidity": 31,
      "visibility": 9.999726596675416,
      "predictability": 68
    },
    {
      "id": 6202392186978304,
      "weather_state_name": "Showers",
      "weather_state_abbr": "s",
      "wind_direction_compass": "SW",
      "created": "2021-07-27T17:36:31.267981Z",
      "applicable_date": "2021-07-28",
      "min_temp": 20.615000000000002,
      "max_temp": 32.730000000000004,
      "the_temp": 31.79,
      "wind_speed": 4.602266762109282,
      "wind_direction": 219.99999999999997,
      "air_pressure": 1015.0,
      "humidity": 33,
      "visibility": 9.999726596675416,
      "predictability": 73
    },
    {
      "id": 5302719851003904,
      "weather_state_name": "Heavy Rain",
      "weather_state_abbr": "hr",
      "wind_direction_compass": "WSW",
      "created": "2021-07-27T17:36:34.158365Z",
      "applicable_date": "2021-07-29",
      "min_temp": 20.38,
      "max_temp": 33.095,
      "the_temp": 32.24,
      "wind_speed": 4.374589199077388,
      "wind_direction": 256.5,
      "air_pressure": 1010.0,
      "humidity": 48,
      "visibility": 9.714517219438479,
      "predictability": 77
    },
    {
      "id": 5447949036290048,
      "weather_state_name": "Heavy Rain",
      "weather_state_abbr": "hr",
      "wind_direction_compass": "NW",
      "created": "2021-07-27T17:12:25.149426Z",
      "applicable_date": "2021-07-30",
      "min_temp": 20.595,
      "max_temp": 32.39,
      "the_temp": 29.91,
      "wind_speed": 3.9883291577189213,
      "wind_direction": 314.5,
      "air_pressure": 1009.0,
      "humidity": 56,
      "visibility": 9.999726596675416,
      "predictability": 77
    },
    {
      "id": 5225509995675648,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "W",
      "created": "2021-07-27T17:12:34.175145Z",
      "applicable_date": "2021-07-31",
      "min_temp": 22.505000000000003,
      "max_temp": 33.66,
      "the_temp": 32.0,
      "wind_speed": 3.7189560963970414,
      "wind_direction": 267.5,
      "air_pressure": 1008.0,
      "humidity": 42,
      "visibility": 9.999726596675416,
      "predictability": 68
    },
    {
      "id": 6392721213227008,
      "weather_state_name": "Light Rain",
      "weather_state_abbr": "lr",
      "wind_direction_compass": "WSW",
      "created": "2021-07-27T17:36:37.148689Z",
      "applicable_date": "2021-08-01",
      "min_temp": 20.72,
      "max_temp": 34.215,
      "the_temp": 31.87,
      "wind_speed": 4.167359420981468,
      "wind_direction": 238.0,
      "air_pressure": 1009.0,
      "humidity": 46,
      "visibility": 9.999726596675416,
      "predictability": 75
    }
  ],
  "time": "2021-07-27T23:19:21.115249+03:00",
  "sun_rise": "2021-07-27T04:57:36.290491+03:00",
  "sun_set": "2021-07-27T20:24:46.188471+03:00",
  "timezone_name": "LMT",
  "parent": {
    "title": "Ukraine",
    "location_type": "Country",
    "woeid": 23424976,
    "latt_long": "48.382881,31.173441"
  },
  "sources": [
    {
      "title": "BBC",
      "slug": "bbc",
      "url": "http://www.bbc.co.uk/weather/",
      "crawl_rate": 360
    },
    {
      "title": "Forecast.io",
      "slug": "forecast-io",
      "url": "http://forecast.io/",
      "crawl_rate": 480
    },
    {
      "title": "HAMweather",
      "slug": "hamweather",
      "url": "http://www.hamweather.com/",
      "crawl_rate": 360
    },
    {
      "title": "OpenWeatherMap",
      "slug": "openweathermap",
      "url": "http://openweathermap.org/",
      "crawl_rate": 360
    },
    {
      "title": "Weather Underground",
      "slug": "wunderground",
      "url": "https://www.wunderground.com/?apiref=fc30dc3cd224e19b",
      "crawl_rate": 720
    },
    {
      "title": "World Weather Online",
      "slug": "world-weather-online",
      "url": "http://www.worldweatheronline.com/",
      "crawl_rate": 360
    }
  ],
  "title": "Kharkiv",
  "location_type": "City",
  "woeid": 922137,
  "latt_long": "49.990101,36.230301",
  "timezone": "Europe/Kiev"
}
''';
