import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_data_provider.dart';
import '../../domain/entities/forecast_entity.dart';
import '../services/location_remote_data_service_impl.dart';

class LocationDataProviderImpl implements LocationDataProvider {
  LocationRemoteDataService service;

  LocationDataProviderImpl({
    required this.service,
  });

  @override
  Future<Either<Failure, ForecastEntity>> fetchForecastData(
    int earthID,
  ) async {
    try {
      final result = await service.fetchForecastData(earthID);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(SocketFailure());
    }
  }
}
