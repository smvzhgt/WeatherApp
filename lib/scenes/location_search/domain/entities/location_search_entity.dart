import 'package:equatable/equatable.dart';

class LocationSearch implements EquatableMixin {
  final int? id;
  final String title;
  final String locationType;
  final int woeid;
  bool isFavorite;

  LocationSearch({
    this.id,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.isFavorite,
  });

  LocationSearch.empty({
    this.id = 0,
    this.title = '',
    this.locationType = '',
    this.woeid = 0,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [id, title, locationType, woeid, isFavorite];

  @override
  bool? get stringify => null;

  LocationSearch toggle() {
    return LocationSearch.empty(isFavorite: !isFavorite);
  }
}
