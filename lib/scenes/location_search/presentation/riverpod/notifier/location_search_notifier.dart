import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state.dart';
import '../../../domain/entities/location_search_entity.dart';
import '../../../domain/interactors/location_search_interactor_impl.dart';
import '../state/location_search_state.dart';

class LocationSearchNotifier extends StateNotifier<WeatherState> {
  final LocationSearchInteractor interactor;

  LocationSearchNotifier(
    this.interactor,
  ) : super(const LocationSearchInitialState());

  Future<void> fetchEarthID({
    required String query,
  }) async {
    state = const LocationSearchLoadingState();
    final either = await interactor.fetchEarthID(query: query);
    if (either.isRight()) {
      final models = either.getOrElse(() => List<LocationSearch>.empty());
      state = LocationSearchLoadedState(models: models);
    } else {
      state = const LocationSearchErrorState();
    }
  }

  // TODO: change return type from LocationSearch to int
  Future<void> setFavoriteLocationSearch({
    required LocationSearch location,
  }) async {
    final either = await interactor.saveLocationSearch(location: location);
    if (either.isRight()) {
      final models = either.getOrElse(() => List<LocationSearch>.empty());
      state = LocationSearchLoadedState(models: models);
    } else {
      state = const LocationSearchErrorState();
    }
  }

  Future<void> unsetFavoriteLocationSearch({
    required LocationSearch location,
  }) async {
    final either = await interactor.deleteLocationSearch(location: location);
    if (either.isRight()) {
      final models = either.getOrElse(() => List<LocationSearch>.empty());
      state = LocationSearchLoadedState(models: models);
    } else {
      state = const LocationSearchErrorState();
    }
  }
}
