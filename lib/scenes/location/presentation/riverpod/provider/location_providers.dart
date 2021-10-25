import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state.dart';
import '../../../../../di/injection.dart';
import '../../../domain/interactors/location_interactor_impl.dart';
import '../notifier/location_notifier.dart';

final locationNotifierProvider =
    StateNotifierProvider<LocationNotifier, WeatherState>((ref) {
  return LocationNotifier(sl<LocationInteractor>());
});
