import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../location_search/domain/entities/location_search_entity.dart';
import '../../domain/data_providers/favorite_data_provider.dart';
import '../datasources/favorite_local_data_source_impl.dart';


class FavoriteDataProviderImpl implements FavoriteDataProvider {
  final FavoriteLocalDataSource localDataSource;

  FavoriteDataProviderImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> loadSearchLocations() async {
    try {
      final result = await localDataSource.loadSearchLocations();
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
      final result = await localDataSource.deleteLocationSearch(location);
      if (!result.isNegative) {
        final result = await localDataSource.loadSearchLocations();
        return Right(result);
      } else {
        return Left(DataBaseFailure());
      }
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }
}
