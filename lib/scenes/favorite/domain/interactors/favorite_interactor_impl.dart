import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../location_search/domain/entities/location_search_entity.dart';
import '../data_providers/favorite_data_provider.dart';

abstract class FavoriteInteractor {
  Future<Either<Failure, List<LocationSearch>>> loadSearchLocations();
  Future<Either<Failure, List<LocationSearch>>> deleteLocation(
    LocationSearch location,
  );
}

class FavoriteInteractorImpl implements FavoriteInteractor {
  final FavoriteDataProvider dataProvider;

  FavoriteInteractorImpl({
    required this.dataProvider,
  });

  @override
  Future<Either<Failure, List<LocationSearch>>> loadSearchLocations() async {
    return await dataProvider.loadSearchLocations();
  }

  @override
  Future<Either<Failure, List<LocationSearch>>> deleteLocation(
    LocationSearch location,
  ) async {
    return await dataProvider.deleteLocation(location);
  }
}
