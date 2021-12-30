import 'package:equatable/equatable.dart';

class LocationSearch with EquatableMixin {
  final String title;
  final String locationType;
  final int woeid;
  bool isFavorite;

  LocationSearch({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.isFavorite,
  });

  LocationSearch.empty({
    this.title = '',
    this.locationType = '',
    this.woeid = 0,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [title, locationType, woeid, isFavorite];

  @override
  bool? get stringify => null;
}
