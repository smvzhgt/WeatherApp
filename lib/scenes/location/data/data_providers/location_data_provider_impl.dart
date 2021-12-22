import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_data_provider.dart';
import '../../domain/entities/forecast_entity.dart';
import '../datasources/location_remote_data_source_impl.dart';

class LocationDataProviderImpl implements LocationDataProvider {
  LocationRemoteDataSource remoteDataSource;

  LocationDataProviderImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ForecastEntity>> fetchForecastData(
    int earthID,
  ) async {
    try {
      final result = await remoteDataSource.fetchForecastData(earthID);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(SocketFailure());
    }
  }
}
