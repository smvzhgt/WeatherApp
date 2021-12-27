import '../models/location_search_model.dart';

abstract class LocationSearchMemoryDataSource {
  void cacheLocations(List<LocationSearchModel> locationModels);
  List<LocationSearchModel> getLocations();
  void updateLocation(LocationSearchModel locationModel);
}

class LocationSearchMemoryDataSourceImpl
    implements LocationSearchMemoryDataSource {
  LocationSearchMemoryDataSourceImpl() : _cachedLocations = [];

  List<LocationSearchModel> _cachedLocations;

  @override
  void cacheLocations(List<LocationSearchModel> locationModels) {
    _cachedLocations = locationModels;
  }

  @override
  List<LocationSearchModel> getLocations() {
    return _cachedLocations;
  }

  @override
  void updateLocation(LocationSearchModel locationModel) {
    _cachedLocations = [
      for (final location in _cachedLocations)
        if (location.woeid == locationModel.woeid)
          LocationSearchModel(
            id: locationModel.id,
            title: locationModel.title,
            locationType: locationModel.locationType,
            woeid: locationModel.woeid,
            isFavorite: locationModel.isFavorite,
          )
        else
          location,
    ];
  }

  void removeLocation(LocationSearchModel location) {
    _cachedLocations = _cachedLocations
        .where((location) => location.id != location.id)
        .toList();
  }
}
