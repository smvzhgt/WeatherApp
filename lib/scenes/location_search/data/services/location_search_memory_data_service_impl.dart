import '../models/location_search_model.dart';

abstract class LocationSearchMemoryDataService {
  void cacheLocations(List<LocationSearchModel> locationModels);
  List<LocationSearchModel> getLocations();
  void updateLocation(LocationSearchModel locationModel);
}

class LocationSearchMemoryDataServiceImpl
    implements LocationSearchMemoryDataService {
  LocationSearchMemoryDataServiceImpl() : cachedLocations = [];

  List<LocationSearchModel> cachedLocations;

  @override
  void cacheLocations(List<LocationSearchModel> locationModels) {
    cachedLocations = locationModels;
  }

  @override
  List<LocationSearchModel> getLocations() {
    return cachedLocations;
  }

  @override
  void updateLocation(LocationSearchModel locationModel) {
    cachedLocations = [
      for (final location in cachedLocations)
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
    cachedLocations = cachedLocations
        .where((location) => location.id != location.id)
        .toList();
  }
}
