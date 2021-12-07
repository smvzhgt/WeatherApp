import 'package:equatable/equatable.dart';

class LocationSearch extends Equatable {
  final int? id;
  final String title;
  final String locationType;
  final int woeid;

  const LocationSearch({
    this.id,
    required this.title,
    required this.locationType,
    required this.woeid,
  });

  @override
  List<Object?> get props => [id, title, locationType, woeid];
}
