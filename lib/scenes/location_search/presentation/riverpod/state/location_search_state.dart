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

class LocationSearchSetFavoriteLoadingState extends WeatherState with EquatableMixin {

  const LocationSearchSetFavoriteLoadingState();

  @override
  List<Object?> get props => [];
}

class LocationSearchSetFavoriteState extends WeatherState with EquatableMixin {
  final int index;

  const LocationSearchSetFavoriteState({
    required this.index,
  });

  @override
  List<Object?> get props => [index];
}

class LocationSearchErrorState extends WeatherState with EquatableMixin {
  const LocationSearchErrorState();

  @override
  List<Object?> get props => [];
}
