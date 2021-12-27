import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_search_data_provider.dart';
import '../../domain/entities/location_search_entity.dart';
import '../datasources/location_search_local_data_source_impl.dart';
import '../datasources/location_search_memory_data_source_impl.dart';
import '../datasources/location_search_remote_data_source_impl.dart';
import '../models/location_search_model.dart';

class LocationSearchDataProviderImpl implements LocationSearchDataProvider {
  LocationSearchRemoteDataSource remoteDataSource;
  LocationSearchLocalDataSource localDataSource;
  LocationSearchMemoryDataSource memoryDataSource;

  LocationSearchDataProviderImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.memoryDataSource,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID(
    String query,
  ) async {
    try {
      final result = await remoteDataSource.fetchEarthID(query);
      memoryDataSource.cacheLocations(result);
      for (final model in result) {
        final savedModel = await localDataSource.getLocationSearch(model);
        if (savedModel != null) {
          memoryDataSource.updateLocation(savedModel);
        }
      }
      return Right(memoryDataSource.getLocations());
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(SocketFailure());
    }
  }

  @override
  Future<Either<Failure, List<LocationSearch>>> saveLocationSearch(
    LocationSearch location,
  ) async {
    try {
      final locationToSave = location.toggle();
      final modelToSave = locationToSave as LocationSearchModel;
      final savedModel = await localDataSource.getLocationSearch(modelToSave);
      if (savedModel == null) {
        final result = await localDataSource.putLocationSearch(modelToSave);
        memoryDataSource.updateLocation(result);
      }
      return Right(memoryDataSource.getLocations());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<LocationSearch>>> deleteLocationSearch(
    LocationSearch location,
  ) async {
    try {
      final modelToDelete = location as LocationSearchModel;
      final result = await localDataSource.deleteLocationSearch(modelToDelete);
      if (result > 0) {
        final model = modelToDelete.toggle();
        memoryDataSource.updateLocation(model);
      }
      return Right(memoryDataSource.getLocations());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
