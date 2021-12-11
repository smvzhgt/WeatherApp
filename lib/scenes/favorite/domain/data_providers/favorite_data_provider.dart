import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../location_search/domain/entities/location_search_entity.dart';

abstract class FavoriteDataProvider{
  Future<Either<Failure, List<LocationSearch>>> loadSearchLocations();
  Future<Either<Failure, List<LocationSearch>>> deleteLocation(LocationSearch location);
}