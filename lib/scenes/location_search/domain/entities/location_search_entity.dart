import 'package:equatable/equatable.dart';

class LocationSearch extends Equatable {
  final String title;
  final String locationType;
  final int woeid;

  const LocationSearch({
    required this.title,
    required this.locationType,
    required this.woeid,
  });

  @override
  List<Object?> get props => [title, locationType, woeid];
}
