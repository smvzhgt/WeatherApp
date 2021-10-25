import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/location_search_entity.dart';

abstract class LocationSearchDataProvider {
  Future<Either<Failure, List<LocationSearch>>> fetchEarthID(
    String query,
  );
}
