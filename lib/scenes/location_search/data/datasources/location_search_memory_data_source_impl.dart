import '../../domain/entities/location_search_entity.dart';

abstract class LocationSearchMemoryDataSource {
  void cacheLocations(List<LocationSearch> locationModels);
  List<LocationSearch> getLocations();
  void updateLocation(LocationSearch locationModel);
}

class LocationSearchMemoryDataSourceImpl
    implements LocationSearchMemoryDataSource {
  LocationSearchMemoryDataSourceImpl() : _cachedLocations = [];

  List<LocationSearch> _cachedLocations;

  @override
  void cacheLocations(List<LocationSearch> locationModels) {
    _cachedLocations = locationModels;
  }

  @override
  List<LocationSearch> getLocations() {
    return _cachedLocations;
  }

  @override
  void updateLocation(LocationSearch locationEntity) {
    _cachedLocations = [
      for (final location in _cachedLocations)
        if (location.woeid == locationEntity.woeid)
          LocationSearch(
            title: locationEntity.title,
            locationType: locationEntity.locationType,
            woeid: locationEntity.woeid,
            isFavorite: locationEntity.isFavorite,
          )
        else
          location,
    ];
  }
}
