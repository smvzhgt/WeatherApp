import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_search_data_provider.dart';
import '../../domain/entities/location_search_entity.dart';
import '../models/location_search_model.dart';
import '../services/location_search_local_data_service_impl.dart';
import '../services/location_search_memory_data_service_impl.dart';
import '../services/location_search_remote_data_service_impl.dart';

class LocationSearchDataProviderImpl implements LocationSearchDataProvider {
  LocationSearchRemoteDataService remoteDataService;
  LocationSearchLocalDataService localDataService;
  LocationSearchMemoryDataService memoryDataService;

  LocationSearchDataProviderImpl({
    required this.remoteDataService,
    required this.localDataService,
    required this.memoryDataService,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID(
    String query,
  ) async {
    try {
      final result = await remoteDataService.fetchEarthID(query);
      memoryDataService.cacheLocations(result);
      for (final model in result) {
        final savedModel = await localDataService.readLocationSearch(model);
        if (savedModel != null) {
          memoryDataService.updateLocation(savedModel);
        }
      }
      return Right(memoryDataService.getLocations());
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
      final savedModel = await localDataService.readLocationSearch(modelToSave);
      if (savedModel == null) {
        final result = await localDataService.saveLocationSearch(modelToSave);
        memoryDataService.updateLocation(result);
      }
      return Right(memoryDataService.getLocations());
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
      final result = await localDataService.deleteLocationSearch(modelToDelete);
      if (result > 0) {
        final model = modelToDelete.toggle();
        memoryDataService.updateLocation(model);
      }
      return Right(memoryDataService.getLocations());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
