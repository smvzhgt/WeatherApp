import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../data_providers/location_search_data_provider.dart';
import '../entities/location_search_entity.dart';

abstract class LocationSearchInteractor {
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID({
    required String query,
  });

  Future<Either<Failure, List<LocationSearch>>> saveLocationSearch({
    required LocationSearch location,
  });

  Future<Either<Failure, List<LocationSearch>>> deleteLocationSearch({
    required LocationSearch location,
  });
}

class LocationSearchInteractorImpl implements LocationSearchInteractor {
  final LocationSearchDataProvider dataProvider;

  LocationSearchInteractorImpl({
    required this.dataProvider,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID({
    required String query,
  }) async {
    return await dataProvider.fetchEarthID(query);
  }

  @override
  Future<Either<Failure, List<LocationSearch>>> saveLocationSearch({
    required LocationSearch location,
  }) async {
    return await dataProvider.saveLocationSearch(location);
  }

  @override
  Future<Either<Failure, List<LocationSearch>>> deleteLocationSearch({
    required LocationSearch location,
  }) async {
    return await dataProvider.deleteLocationSearch(location);
  }
}
