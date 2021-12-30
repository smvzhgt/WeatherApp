class LocationSearchFields {
  static const String tableName = "locationSearch";
  static const List<String> values = [
    id,
    title,
    locationType,
    woeid,
    isFavorite
  ];

  static const String id = "_id";
  static const String title = "title";
  static const String locationType = "location_type";
  static const String woeid = "woeid";
  static const String isFavorite = "is_favorite";
}
