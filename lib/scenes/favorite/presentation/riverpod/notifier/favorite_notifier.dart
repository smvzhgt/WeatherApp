import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecastapp/core/state.dart';

import '../../../../location_search/domain/entities/location_search_entity.dart';
import '../../../domain/interactors/favorite_interactor_impl.dart';
import '../state/favorite_state.dart';

class FavoriteNotifier extends StateNotifier<WeatherState> {
  final FavoriteInteractor interactor;

  FavoriteNotifier(
    this.interactor,
  ) : super(const FavoriteInitialState());

  Future<void> loadSearchLocations() async {
    state = const FavoriteLoadingState();
    final either = await interactor.loadSearchLocations();
    if (either.isRight()) {
      final models = either.getOrElse(() => List<LocationSearch>.empty());
      state = FavoriteLoadedState(models: models);
    } else {
      state = const FavoriteErrorState();
    }
  }

  Future<void> deleteLocation(LocationSearch location) async {
    state = const FavoriteLoadingState();
    final either = await interactor.deleteLocation(location);
    if (either.isRight()) {
      final models = either.getOrElse(() => List<LocationSearch>.empty());
      state = FavoriteLoadedState(models: models);
    } else {
      state = const FavoriteErrorState();
    }
  }
}
