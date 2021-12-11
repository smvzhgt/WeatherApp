import 'package:equatable/equatable.dart';
import 'package:forecastapp/core/state.dart';

import '../../../../location_search/domain/entities/location_search_entity.dart';

class FavoriteInitialState extends WeatherState with EquatableMixin {
  const FavoriteInitialState();

  @override
  List<Object?> get props => [];
}

class FavoriteLoadingState extends WeatherState with EquatableMixin {
  const FavoriteLoadingState();

  @override
  List<Object?> get props => [];
}

class FavoriteLoadedState extends WeatherState with EquatableMixin {
  final List<LocationSearch> models;

  const FavoriteLoadedState({
    required this.models,
  });

  @override
  List<Object?> get props => [models];
}

class FavoriteErrorState extends WeatherState with EquatableMixin {
  const FavoriteErrorState();

  @override
  List<Object?> get props => [];
}
