import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_search_data_provider.dart';
import '../../domain/entities/location_search_entity.dart';
import '../models/location_search_model.dart';
import '../services/location_search_service_impl.dart';
import 'LocationSearchCache.dart';

class LocationSearchDataProviderImpl implements LocationSearchDataProvider {
  LocationSearchService service;
  LocationSearchCache cache;

  LocationSearchDataProviderImpl({
    required this.service,
    required this.cache,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID(
    String query,
  ) async {
    try {
      final result = await service.fetchEarthID(query);
      cache.cacheLocations(result);
      for (final model in result) {
        final savedModel = await service.readLocationSearch(model);
        if (savedModel != null) {
          cache.updateLocation(savedModel);
        }
      }
      return Right(cache.getLocations());
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
      final savedModel = await service.readLocationSearch(modelToSave);
      if (savedModel == null) {
        final result = await service.saveLocationSearch(modelToSave);
        cache.updateLocation(result);
      }
      return Right(cache.getLocations());
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
      final result = await service.deleteLocationSearch(modelToDelete);
      if (result > 0) {
        final model = modelToDelete.toggle();
        cache.updateLocation(model);
      }
      return Right(cache.getLocations());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}