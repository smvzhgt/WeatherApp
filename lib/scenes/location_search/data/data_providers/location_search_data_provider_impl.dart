import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_search_data_provider.dart';
import '../../domain/entities/location_search_entity.dart';
import '../services/location_search_service_impl.dart';

class LocationSearchDataProviderImpl implements LocationSearchDataProvider {
  LocationSearchService service;

  LocationSearchDataProviderImpl({
    required this.service,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID(
    String query,
  ) async {
    try {
      final result = await service.fetchEarthID(query);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(SocketFailure());
    }
  }
}
