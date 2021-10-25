import 'package:equatable/equatable.dart';

import '../../../../../core/state.dart';
import '../../../domain/entities/forecast_entity.dart';

class LocationInitialState extends WeatherState with EquatableMixin {
  const LocationInitialState();

  @override
  List<Object?> get props => [];
}

class LocationLoadingState extends WeatherState with EquatableMixin {
  const LocationLoadingState();

  @override
  List<Object?> get props => [];
}

class LocationLoadedState extends WeatherState with EquatableMixin {
  final ForecastEntity entity;

  const LocationLoadedState({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class LocationErrorState extends WeatherState with EquatableMixin {
  const LocationErrorState();

  @override
  List<Object?> get props => [];
}
