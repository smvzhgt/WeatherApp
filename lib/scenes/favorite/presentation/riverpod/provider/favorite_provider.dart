import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecastapp/core/state.dart';
import 'package:forecastapp/di/injection.dart';

import '../../../domain/data_providers/favorite_data_provider.dart';
import '../../../domain/interactors/favorite_interactor_impl.dart';
import '../notifier/favorite_notifier.dart';

final favoriteInteractorProvider = Provider<FavoriteInteractor>(
  (ref) => FavoriteInteractorImpl(
    dataProvider: sl<FavoriteDataProvider>(),
  ),
);

final favoriteNotifierProvider =
    StateNotifierProvider<FavoriteNotifier, WeatherState>(
  (ref) => FavoriteNotifier(
    ref.watch(favoriteInteractorProvider),
  ),
);
