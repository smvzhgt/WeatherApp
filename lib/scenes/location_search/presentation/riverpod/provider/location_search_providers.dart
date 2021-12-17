import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/data_providers/location_search_data_provider.dart';

import '../../../../../core/state.dart';
import '../../../../../di/injection.dart';
import '../../../domain/interactors/location_search_interactor_impl.dart';
import '../notifier/location_search_notifier.dart';

final lsInteractorProvider = Provider<LocationSearchInteractor>(
  (ref) => LocationSearchInteractorImpl(
    dataProvider: sl<LocationSearchDataProvider>(),
  ),
);

final lsNotifierProvider =
    StateNotifierProvider<LocationSearchNotifier, WeatherState>(
  (ref) => LocationSearchNotifier(
    ref.watch(lsInteractorProvider),
  ),
);
