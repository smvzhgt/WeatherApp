import 'package:equatable/equatable.dart';

class ParentEntity extends Equatable {
  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;

  const ParentEntity({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  const ParentEntity.empty({
    this.title = '',
    this.locationType = '',
    this.woeid = 0,
    this.lattLong = '',
  });

  @override
  List<Object?> get props => [title, locationType, woeid, lattLong];
}
