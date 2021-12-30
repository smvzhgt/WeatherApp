import '../../domain/entities/location_search_entity.dart';
import 'location_search_model.dart';

class LocationSearchUtil {
  static LocationSearchModel fromEntity({
    required LocationSearch location,
  }) {
    return LocationSearchModel(
      id: 0,
      title: location.title,
      locationType: location.locationType,
      woeid: location.woeid,
      isFavorite: location.isFavorite,
    );
  }

  static LocationSearch toggle({
    required LocationSearch location,
  }) {
    return LocationSearch(
      title: location.title,
      locationType: location.locationType,
      woeid: location.woeid,
      isFavorite: !location.isFavorite,
    );
  }
}
