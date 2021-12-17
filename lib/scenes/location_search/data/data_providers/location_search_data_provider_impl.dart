import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/data_providers/location_search_data_provider.dart';
import '../../domain/entities/location_search_entity.dart';
import '../models/location_search_model.dart';
import '../services/location_search_service_impl.dart';

class LocationSearchDataProviderImpl implements LocationSearchDataProvider {
  LocationSearchService service;
  List<LocationSearchModel> locations;

  LocationSearchDataProviderImpl({
    required this.service,
  }) : locations = [];

  void updateLocation({required LocationSearchModel locationModel}) {
    locations = [
      for (final location in locations)
        if (location.id == locationModel.id)
          LocationSearchModel(
            id: locationModel.id,
            title: locationModel.title,
            locationType: locationModel.locationType,
            woeid: locationModel.woeid,
            isFavorite: locationModel.isFavorite,
          )
        else
          locationModel,
    ];
  }

  void removeLocation(LocationSearchModel location) {
    locations =
        locations.where((location) => location.id != location.id).toList();
  }

  @override
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID(
    String query,
  ) async {
    try {
      final result = await service.fetchEarthID(query);
      locations = result;
      for (final model in result) {
        final savedModel = await service.readLocationSearch(model);
        if (savedModel != null) {
          updateLocation(locationModel: savedModel);
        }
      }
      return Right(locations);
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
        updateLocation(locationModel: result);
      }
      return Right(locations);
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
        updateLocation(locationModel: model);
      }
      return Right(locations);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
