import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_search_data_provider.dart';
import '../../domain/entities/location_search_entity.dart';
import '../datasources/location_search_database_data_source_impl.dart';
import '../datasources/location_search_memory_data_source_impl.dart';
import '../datasources/location_search_remote_data_source_impl.dart';
import '../models/LocationSearchMapper.dart';

class LocationSearchDataProviderImpl implements LocationSearchDataProvider {
  LocationSearchRemoteDataSource remoteDataSource;
  LocationSearchDataBaseDataSource localDataSource;
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
        final savedModel = await localDataSource.getLocationSearch(model.woeid);
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
      final savedModel =
          await localDataSource.getLocationSearch(location.woeid);
      if (savedModel == null) {
        final locationToSave = LocationSearchUtil.toggle(location: location);
        final modelToSave =
            LocationSearchUtil.fromEntity(location: locationToSave);
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
      final result = await localDataSource.deleteLocationSearch(location.woeid);
      if (result > 0) {
        final locationToUpdate = LocationSearchUtil.toggle(location: location);
        memoryDataSource.updateLocation(locationToUpdate);
      }
      return Right(memoryDataSource.getLocations());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
