import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/pages/empty_page.dart';
import '../../../../core/pages/error_page.dart';
import '../../../../core/pages/loading_page.dart';
import '../../../../core/state.dart';
import '../../../../generated/l10n.dart';
import '../../../location_search/domain/entities/location_search_entity.dart';
import '../riverpod/provider/location_providers.dart';
import '../riverpod/state/location_state.dart';
import 'weather_page_view.dart';

class LocationPage extends StatefulWidget {
  static const routeName = 'locationPage';

  const LocationPage({
    Key? key,
  }) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _fetchWeatherData();
  }

  void _fetchWeatherData() {
    final entity = ModalRoute.of(context)?.settings.arguments as LocationSearch;
    context
        .read(locationNotifierProvider.notifier)
        .fetchForecastData(entity.woeid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).page_title_forecast),
      ),
      body: Consumer(builder: (context, watch, child) {
        final state = watch(locationNotifierProvider);
        return Center(child: _buildState(state));
      }),
    );
  }

  Widget _buildState(WeatherState state) {
    if (state is LocationInitialState) {
      return const EmptyPage();
    } else if (state is LocationLoadingState) {
      return const LoadingPage();
    } else if (state is LocationLoadedState) {
      final entity = state.entity;
      return WeatherPageView(entities: entity.consolidatedWeather);
    } else if (state is LocationErrorState) {
      final message = S.of(context).error_loading_weather_data;
      return ErrorPage(message: message);
    }
    throw ArgumentError(S.of(context).error_message_no_view_state + "$state");
  }
}
