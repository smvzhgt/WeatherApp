import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecastapp/generated/l10n.dart';

import '../../../../core/pages/empty_page.dart';
import '../../../../core/pages/error_page.dart';
import '../../../../core/pages/information_page.dart';
import '../../../../core/pages/loading_page.dart';
import '../../../../core/state.dart';
import '../../../location_search/domain/entities/location_search_entity.dart';
import '../../../location_search/presentation/widgets/location_search_row_item.dart';
import '../riverpod/provider/favorite_provider.dart';
import '../riverpod/state/favorite_state.dart';

class FavoritePage extends StatefulWidget {
  static const routeName = "favorite";

  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_){
      context.read(favoriteNotifierProvider.notifier).loadSearchLocations();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).page_title_favorite_location),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final state = watch(favoriteNotifierProvider);
          return _buildState(state);
        },
      ),
    );
  }

  Widget _buildState(WeatherState state) {
    if (state is FavoriteLoadingState) {
      return const Center(child: LoadingPage());
    } else if (state is FavoriteLoadedState) {
      final entities = state.models;
      if (entities.isEmpty) {
        return Center(
          child: InformationPage(
            message: S.of(context).no_favorite_message_information_page,
          ),
        );
      }
      return _buildList(entities);
    } else if (state is FavoriteErrorState) {
      final message = S.of(context).error_loading_weather_data;
      return Center(child: ErrorPage(message: message));
    } else {
      return const EmptyPage();
    }
  }

  Widget _buildList(List<LocationSearch> locations) {
    return ListView.separated(
      itemCount: locations.length,
      itemBuilder: (BuildContext context, int index) {
        return LocationSearchRowItem(
          entity: locations[index],
          onClickButton: _onClickButton,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void _onClickButton(LocationSearch location) {
    context.read(favoriteNotifierProvider.notifier).deleteLocation(location);
  }
}
