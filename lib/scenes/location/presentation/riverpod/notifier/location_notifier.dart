import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state.dart';
import '../../../domain/entities/forecast_entity.dart';
import '../../../domain/interactors/location_interactor_impl.dart';
import '../state/location_state.dart';

class LocationNotifier extends StateNotifier<WeatherState> {
  final LocationInteractor interactor;

  LocationNotifier(
    this.interactor,
  ) : super(const LocationInitialState());

  Future<void> fetchForecastData(
    int earthID,
  ) async {
    state = const LocationLoadingState();
    final either = await interactor.fetchForecastData(earthID);
    if (either.isRight()) {
      final entity = either.getOrElse(() => const ForecastEntity.empty());
      state = LocationLoadedState(entity: entity);
    } else {
      state = const LocationErrorState();
    }
  }
}
