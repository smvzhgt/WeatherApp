import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/weather_entity.dart';
import '../widgets/detail_location_date_item.dart';
import '../widgets/detail_location_row_item.dart';
import '../widgets/detail_location_temperature_row_item.dart';
import '../widgets/detail_location_top_image_row_item.dart';
import '../widgets/detail_location_wind_row_item.dart';

class WeatherPage extends StatelessWidget {
  final WeatherEntity entity;

  const WeatherPage({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _imageSize = _size.width * 0.1;
    final _rowHeight = _size.width * 0.15;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DetailLocationDateItem(
          containerHeight: _rowHeight,
          text: entity.applicableDateFormat,
        ),
        const SizedBox(height: kSizedBoxHeightMedium),
        DetailLocationTopImageRowItem(
          size: _size,
          imageName: entity.weatherStateAbbr,
          stateName: entity.weatherStateName,
        ),
        const SizedBox(height: kSizedBoxHeightSmall),
        DetailLocationTemperatureRowItem(
            size: _size,
            minTemp: entity.minTempFormat,
            maxTemp: entity.maxTempFormat,
            temp: entity.theTempFormat),
        const SizedBox(height: kSizedBoxHeightSmall),
        DetailLocationWindRowItem(
            size: _size,
            angle: entity.windDirection,
            text: "${entity.windSpeedFormat} " +
                S.of(context).suffix_wind_speed),
        const SizedBox(height: kSizedBoxHeightSmall),
        DetailLocationRowItem(
            containerHeight: _rowHeight,
            imageHeight: _imageSize,
            imageWidth: _imageSize,
            imageName: kImagePathCompass,
            text: entity.windDirectionCompassFormat),
        const SizedBox(height: kSizedBoxHeightSmall),
        DetailLocationRowItem(
            containerHeight: _rowHeight,
            imageHeight: _imageSize,
            imageWidth: _imageSize,
            imageName: kImagePathPressure,
            text: "${entity.airPressureFormat} " +
                S.of(context).suffix_pressure),
        const SizedBox(height: kSizedBoxHeightSmall),
        DetailLocationRowItem(
            containerHeight: _rowHeight,
            imageHeight: _imageSize,
            imageWidth: _imageSize,
            imageName: kImagePathVisibility,
            text: "${entity.visibilityFormat} " +
                S.of(context).suffix_path_visibility),
        const SizedBox(height: kSizedBoxHeightSmall),
        DetailLocationRowItem(
            containerHeight: _rowHeight,
            imageHeight: _imageSize,
            imageWidth: _imageSize,
            imageName: kImagePathHumidity,
            text: "${entity.humidity} " + S.of(context).suffix_path_humidity),
      ],
    );
  }
}
