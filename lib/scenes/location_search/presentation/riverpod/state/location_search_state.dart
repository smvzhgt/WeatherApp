import 'package:equatable/equatable.dart';

import '../../../../../core/state.dart';
import '../../../domain/entities/location_search_entity.dart';

class LocationSearchInitialState extends WeatherState with EquatableMixin {
  const LocationSearchInitialState();

  @override
  List<Object?> get props => [];
}

class LocationSearchLoadingState extends WeatherState with EquatableMixin {
  const LocationSearchLoadingState();

  @override
  List<Object?> get props => [];
}

class LocationSearchLoadedState extends WeatherState with EquatableMixin {
  final List<LocationSearch> models;

  const LocationSearchLoadedState({
    required this.models,
  });

  @override
  List<Object?> get props => [models];
}

class LocationSearchErrorState extends WeatherState with EquatableMixin {
  const LocationSearchErrorState();

  @override
  List<Object?> get props => [];
}
