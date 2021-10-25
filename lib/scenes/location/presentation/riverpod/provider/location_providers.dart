import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/data_providers/location_data_provider.dart';

import '../../../../../core/state.dart';
import '../../../../../di/injection.dart';
import '../../../domain/interactors/location_interactor_impl.dart';
import '../notifier/location_notifier.dart';

final locationInteractorProvider = Provider<LocationInteractor>(
  (ref) => LocationInteractorImpl(
    dataProvider: sl<LocationDataProvider>(),
  ),
);

final locationNotifierProvider =
    StateNotifierProvider<LocationNotifier, WeatherState>(
  (ref) => LocationNotifier(
    ref.watch(locationInteractorProvider),
  ),
);
