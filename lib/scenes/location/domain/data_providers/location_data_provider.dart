import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/forecast_entity.dart';

abstract class LocationDataProvider {
  Future<Either<Failure, ForecastEntity>> fetchForecastData(
    int earthID,
  );
}
