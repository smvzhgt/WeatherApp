import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../data_providers/location_data_provider.dart';
import '../entities/forecast_entity.dart';

abstract class LocationInteractor {
  Future<Either<Failure, ForecastEntity>> fetchForecastData(
    int earthID,
  );
}

class LocationInteractorImpl implements LocationInteractor {
  final LocationDataProvider dataProvider;

  LocationInteractorImpl({
    required this.dataProvider,
  });

  @override
  Future<Either<Failure, ForecastEntity>> fetchForecastData(
    int earthID,
  ) async {
    return await dataProvider.fetchForecastData(earthID);
  }
}
