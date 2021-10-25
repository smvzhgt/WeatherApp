import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state.dart';
import '../../../../../di/injection.dart';
import '../../../domain/interactors/location_search_interactor_impl.dart';
import '../notifier/location_search_notifier.dart';

final locationSearchNotifierProvider =
    StateNotifierProvider<LocationSearchNotifier, WeatherState>((ref) {
  return LocationSearchNotifier(sl<LocationSearchInteractor>());
});
