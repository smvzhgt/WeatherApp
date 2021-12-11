import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../location_search/domain/entities/location_search_entity.dart';
import '../../domain/data_providers/favorite_data_provider.dart';
import '../services/favorite_service_impl.dart';

class FavoriteDataProviderImpl implements FavoriteDataProvider {
  final FavoriteService service;

  FavoriteDataProviderImpl({
    required this.service,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> loadSearchLocations() async {
    try {
      final result = await service.loadSearchLocations();
      return Right(result);
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<LocationSearch>>> deleteLocation(
    LocationSearch location,
  ) async {
    try {
      final result = await service.deleteLocationSearch(location);
      if (!result.isNegative) {
        final result = await service.loadSearchLocations();
        return Right(result);
      } else {
        return Left(DataBaseFailure());
      }
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
